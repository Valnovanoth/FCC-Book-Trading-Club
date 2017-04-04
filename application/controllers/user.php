<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class User extends Public_Controller {

    function __construct() {
        parent::__construct();
        
        $this->load->library('ion_auth');
        $this->load->library('form_validation');
        
        $this->load->helper('cookie');
    }

    public function index() {
        $this->load->view('welcome_message');
    }

    public function login() {
        $this->data['pagename'] = 'login';
        
        $this->data['title'] = "Login";
                
        $this->form_validation->set_rules('username', 'Username', 'trim|required');
        $this->form_validation->set_rules('password', 'Password', 'required');        
        
        if ($this->form_validation->run() === FALSE) {
            //$this->load->helper('form');
            $this->render('user/login_view');
        } else {
            $remember = (bool) $this->input->post('remember');
            if ($this->ion_auth->login($this->input->post('username'), $this->input->post('password'), $remember)) {
                redirect('dashboard');
            } else {
                $_SESSION['auth_message'] = $this->ion_auth->errors();
                $this->session->mark_as_flash('auth_message');
                redirect('login');
            }
        }
    }

    public function logout()
    {
            $this->ion_auth->logout();
            redirect('login');
    }
    
    public function register()
    {
        $this->data['pagename'] = 'register';

        $this->form_validation->set_rules('username', 'Username', 'trim|required|is_unique[users.username]');
        $this->form_validation->set_rules('email', 'Email', 'trim|valid_email|required');
        $this->form_validation->set_rules('password', 'Password', 'trim|min_length[4]|max_length[20]|required');         

        if ($this->form_validation->run() === FALSE) {                        
            //$this->load->helper('form');
            $this->render('user/register_view');
        } else {
            $username = $this->input->post('username');
            $email = $this->input->post('email');
            $password = $this->input->post('password');                        

            $this->load->library('ion_auth');
            if ($this->ion_auth->register($username, $password, $email)) {
                $_SESSION['auth_message'] = 'The account has been created. You may now login.';
                $this->session->mark_as_flash('auth_message');
                redirect('login');
            } else {
                $_SESSION['auth_message'] = $this->ion_auth->errors();
                $this->session->mark_as_flash('auth_message');
                redirect('register');
            }
        }    
    }
    
    /*public function testlogin() {
            // ADMIN LOGIN
            if ($this->ion_auth->login("administrator", "password", false))
            {
                echo "Admin login successful <br/>";
                $this->ion_auth->logout();
            }
            else
                echo "Admin login failed";

            // MEMBER LOGIN
            if ($this->ion_auth->login("example@example.com", "pwhere", false))
            {
                echo "Member login successful";
                $this->ion_auth->logout();
            }
            else
                echo "Member login failed";
                        
    }*/

}
