<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends Auth_Controller {
    
    public $in_trade_requests;
    public $out_trade_requests;
    
    function __construct() {
        parent::__construct();
        $this->data['username'] = $this->session->username;
        
        $this->load->model('app/dashboard_model');
        
        $this->load->library('form_validation');
        $this->load->library('html_grabber');
                    
        $this->data['css'] = 'dashboard';
        
        // Get Outbound and Inbound trade requests
        $this->data['out_trade_req'] = $this->dashboard_model->get_out_trade_requests();
        $this->data['in_trade_req'] = $this->dashboard_model->get_in_trade_requests();        
    }

    public function index() { 
        $this->data['pagename'] = 'home'; 
        
        //vdebug($_COOKIE);
        
        $this->render('dashboard/index_view');
    }
    
    public function user_settings($subcommand = '') {
        $this->data['pagename'] = 'user-settings';
        
        $this->data['subcommand'] = $subcommand; //! E se un user malizioso scrive nell'URL update-profile? 
                                                 //  Azzera i suoi settings??
        
        // No jumbotron template
        $this->data['jumbotron'] = FALSE;            
        
        //! Scrivere funzione x distinguere i due casi ?
        switch ($subcommand) {
            case 'update-profile' : {                                
                $this->form_validation->set_rules('city', 'City', 'trim|required|regex_match[/^[a-zA-Z\040]+$/]');
                $this->form_validation->set_rules('state', 'State', 'trim|required|regex_match[/^[a-zA-Z\040]+$/]');  
                
                if ( $this->form_validation->run() === FALSE ) {
                    //$this->load->helper('form');
                    $this->render('dashboard/user_settings_view');
                } else {
                    /*if ($this->ion_auth->login($this->input->post('username'), $this->input->post('password'), $remember)) {
                        redirect('dashboard');
                    } else*/ {
                        // Query
                        $_SESSION['upd_prof_auth_message'] = $this->ion_auth->errors();
                        $this->session->mark_as_flash('auth_message');
                        redirect('login');
                    }
                }                
                
                break;
            }
            case 'change-password' : {
                break;
            } 
            default : {
                //redirect('dashboard/user-settings');
            }
        }
        
        $this->render('dashboard/user_settings_view');
    }
    
    public function all_books() {
        $this->data['pagename'] = 'all-books';
        
        // No jumbotron template
        $this->data['jumbotron'] = FALSE;
        
        // Get user id to use it in queries
        $query_data['user_id'] = $this->session->userdata('user_id');

        // Show all books
        $this->data['my_books'] = $this->dashboard_model->read();        
        
        $this->render('dashboard/books/all_books');
    }
    
    public function my_books() {
        $this->data['pagename'] = 'my-books';
        
        // No jumbotron template
        $this->data['jumbotron'] = FALSE;
        
        // Get user id to use it in queries
        $query_data['user_id'] = $this->session->userdata('user_id');
        
        // Add book code
        if ( $this->input->post('add_book_submit') !== NULL ) {
            $this->form_validation->set_rules('title', 'Title', 'trim|required|alpha_numeric_spaces');
            
            if ( $this->form_validation->run() === FALSE ) {
                //$this->load->helper('form');
                //redirect('dashboard/my-books');
            } else {       
                // If the form anti-resubmit cookie is set, skip add book routine
                /*if (isset($_COOKIE['FormSubmitted'])) {
                    redirect('dashboard/my-books');
                }*/
                
                $query_data['title']         = $this->input->post('title');
                $query_data['isbn']          = $this->dashboard_model->get_isbn13_w_rest_api($query_data['title']);
                $query_data['thumbnail_url'] = $this->dashboard_model->get_thumbnail_url_w_rest_api(
                                                    $query_data['title'], 
                                                    $query_data['isbn']
                                                );
                
                $this->dashboard_model->create($query_data);  
                
                // Set cookie to prevent form resubmit
                //setcookie('FormSubmitted', '1');
                
                redirect('dashboard/my-books');
            }  
        }
        
        // Show books for this user
        $this->data['my_books'] = $this->dashboard_model->read($query_data);
        
        $this->render('dashboard/books/my_books');
    }    
    
    /*public function new_poll() {        
        if ( $this->input->post('submit') !== NULL ) {
            // Create poll
            $query_data['poll_name']      = $this->input->post('poll');
            $query_data['poll_options']   = $this->input->post('newoption');
            $this->dashboard_model->create($query_data);
            
            // Show poll URL
            $this->data['poll_url'] =                 
                base_url() .
                rawurlencode($this->session->userdata('username')) . '/' .
                rawurlencode($this->input->post('poll'));
            $this->data['poll_show_url'] =                 
                base_url() .
                $this->session->userdata('username') . '/' .
                $this->input->post('poll');
            //vdebug($this->data['poll_url']);
                
            $this->render('dashboard/poll_created_view');
        } else {
            $this->render('dashboard/new_poll_view');
        }        
    }
    
    public function my_polls() {    
        // Get polls
        $this->data['polls'] = NULL;        
        $rs = $this->dashboard_model->read();
        $prev_poll_title = '';
        foreach ($rs as $row) {
            // If the title of the prev row is different, it's a new poll
            if ($prev_poll_title != $row['title']) {
                // After the last option row of the first poll and every time since,
                // we save the object to the output before creating one anew
                if ($prev_poll_title != '') { $this->data['polls'][] = $poll; }
                
                $poll = new Poll();
                $poll->uid = $row['uid'];
                $poll->id = $row['id'];
                $poll->title = $row['title'];
                
                // Save prev poll title
                $prev_poll_title = $row['title'];                   
            }                       
            $poll->options[] = $row['option'];
            $poll->votes[] = $row['votes'];
        }
        $this->data['polls'][] = $poll;
        //vdebug($this->data['polls']);
        
        $this->render('dashboard/my_polls_view');
    } */ 
    
    function ajax_delete_book() {
        // Delete book
        $query_data['book_id'] = $this->input->post('id');
        $rs = $this->dashboard_model->delete($query_data);        
    }
    
    function ajax_issue_trade_request() {        
        $query_data['book_id'] = $this->input->post('id');
        $query_data['issuer_user_id'] = $this->session->user_id;
        
        // Issue trade 
        $rs = $this->dashboard_model->issue_trade_request($query_data); 
        
        //redirect('dashboard');
    } 
    
    function ajax_do_trade_book() {
        $query_data['book_id'] = $this->input->post('id');
        
        $command = $this->input->post('command');        
        switch ($command) {
            case 'accept' : {
                $rs = $this->dashboard_model->accept_trade_request($query_data); 
                break;
            }
            case 'cancel' : {
                $rs = $this->dashboard_model->cancel_trade_request($query_data); 
                break;
            } 
            default :
        }        
        
        //redirect('dashboard');
    }    
    
    /*
    function ajax_my_polls_view_polllist() {
        include( 'application/views/dashboard/my_polls/poll_list.php' );
    }*/

}



class Poll {
    
    public $id;
    public $title;
    public $options;
    
    function __construct() {
        $this->id = 0;
        $this->title = '';
        $this->options = array();
    }
            
}
