<?php

class Dashboard_model extends CI_Model {

    function __construct() {
        parent::__construct();
    }
    
    function get_in_trade_requests() {
        $output = array();
        
        $user_id = $this->session->userdata('user_id');        
        $sql = "SELECT *
                FROM btcapp_books
                WHERE user_id = " . $this->db->escape($user_id) . "
                AND issuer_user_id IS NOT NULL";
        $output['rs'] = $this->db->query($sql)->result_array();
        $output['count'] = $this->db->affected_rows();
        return $output;
    }
    
    function get_out_trade_requests() {
        $output = array();
        
        $user_id = $this->session->userdata('user_id');        
        $sql = "SELECT * 
                FROM btcapp_books
                WHERE issuer_user_id = " . $this->db->escape($user_id);        
        $output['rs'] = $this->db->query($sql)->result_array();
        $output['count'] = $this->db->affected_rows();
        return $output;
    }     
    
    function get_isbn13_w_rest_api($book_title) {
        
        $isbn = '';        
        
        // Endpoint URL parameters
            $ep_base_url = 'http://isbndb.com/api/v2/json';
            $api_key = 'GD76CDDH';
            $ep_name = 'book';
            $formatted_book_title = str_replace(' ', '_', strtolower($book_title));
            
	$ep_full_url = $ep_base_url . '/' . $api_key . '/' . $ep_name . '/' . urlencode($formatted_book_title);

        // Request ISBN 13 if not in cache, else read from cache
            $cache_file = 'application/cache/book_isbn/' . urlencode($formatted_book_title) . '.txt';
            
            if ( ! file_exists($cache_file)) {
                //$url="https://new.aol.com/productsweb/subflows/ScreenNameFlow/AjaxSNAction.do?s=username&f=firstname&l=lastname";
                $agent = 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12';

                //$request = curl_init($this_public_ip);
                $request = curl_init();
                curl_setopt($request, CURLOPT_SSL_VERIFYPEER, false);
                curl_setopt($request, CURLOPT_VERBOSE, true);
                curl_setopt($request, CURLOPT_RETURNTRANSFER, true);
                curl_setopt($request, CURLOPT_USERAGENT, $agent);
                curl_setopt($request, CURLOPT_FOLLOWLOCATION, true);
                curl_setopt($request, CURLOPT_URL, $ep_full_url);

                $response = json_decode(curl_exec($request));                
                //vdebug($response);
                
                $isbn = $response->data[0]->isbn13;                       
                
                // Cache it
                $fp = file_put_contents($cache_file, $isbn.PHP_EOL);
                
            } else {          
                // Read from cache
                $isbn = file_get_contents($cache_file);
            }   
        
        return $isbn;        
    } 
    
    function get_thumbnail_url_w_rest_api($book_title, $isbn) {
        
        $thumbnail_url = '';        
        
        // Endpoint URL parameters
            $ep_base_url = 'https://openlibrary.org/api/books?bibkeys=ISBN';
            $ep_name = 'book';
            
	$ep_full_url = $ep_base_url . ':' . $isbn . '&format=json';
        
        // Request thumbnail URL
            //$url="https://new.aol.com/productsweb/subflows/ScreenNameFlow/AjaxSNAction.do?s=username&f=firstname&l=lastname";
            $agent = 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12';

            //$request = curl_init($this_public_ip);
            $request = curl_init();
            curl_setopt($request, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($request, CURLOPT_VERBOSE, true);
            curl_setopt($request, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($request, CURLOPT_USERAGENT, $agent);
            curl_setopt($request, CURLOPT_FOLLOWLOCATION, true);
            curl_setopt($request, CURLOPT_URL, $ep_full_url);
            //vdebug($ep_full_url);

            $response = json_decode(curl_exec($request));                
            //vdebug($response);

            $json_property = "ISBN:" . $isbn;
            $thumbnail_url = $response->$json_property->thumbnail_url;                       
            //vdebug($thumbnail_url);
        
        // Medium size
            return str_replace('-S', '-M', $thumbnail_url);        
    }    
    
    /*function grab_isbn($book_title) {
        $isbn = '';        
        // This public IP
        $this_public_ip = file_get_contents("https://api.ipify.org");
        // URL to grab from
        $base_url = 'http://www.isbnsearch.org/search';
        
	$start_tag = '<p class="isbn isbnleft">ISBN-13: ';
	$end_tag = '</p>';
	$show_tags = 0; // do you want the tags to be shown when you show the html? 1 = yes, 0 = no	
	
	$grab = new Html_Grabber;
        
        // cURL - Fake Web Browser
            //$url="https://new.aol.com/productsweb/subflows/ScreenNameFlow/AjaxSNAction.do?s=username&f=firstname&l=lastname";
            $agent = 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12';

            $request = curl_init($this_public_ip);
            curl_setopt($request, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($request, CURLOPT_VERBOSE, true);
            curl_setopt($request, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($request, CURLOPT_USERAGENT, $agent);
            curl_setopt($request, CURLOPT_FOLLOWLOCATION, true);
            curl_setopt($request, CURLOPT_URL, $base_url . '?s=' . curl_escape($request, $book_title));
            $result = curl_exec($request);
            vdebug($result);    
        
        //$grab->grabhtml( $url, $start_tag, $end_tag );		
	
	foreach( $grab->html[0] as $html ) {		
            $innerhtml .= htmlspecialchars( $grab->strip( $html, $show_tags, $start_tag, $end_tag ) );		
	}        
        
        return $isbn;
    }*/ 
    
    function issue_trade_request($query_data) {        
        $sql = "UPDATE btcapp_books
                SET issuer_user_id = " . $this->db->escape($query_data['issuer_user_id']) . ",
                    accepted = 0 
                WHERE id = " . $this->db->escape($query_data['book_id']);
        //vdebug($sql);
        $this->db->query($sql);
    }   
    
    function accept_trade_request($query_data) {
        $sql = "UPDATE btcapp_books
                SET accepted = 1  
                WHERE id = " . $this->db->escape($query_data['book_id']);
        //vdebug($sql);
        $this->db->query($sql);        
    }
    
    function cancel_trade_request($query_data) {
        $sql = "UPDATE btcapp_books
                SET accepted = NULL, 
                    issuer_user_id = NULL 
                WHERE id = " . $this->db->escape($query_data['book_id']);
        //vdebug($sql);
        $this->db->query($sql);        
    }    
  
    

    /**
     * CREATE BOOK
     */
    function create($query_data) {  
        $user_id        = $query_data['user_id'];
        $title          = $query_data['title'];
        $isbn           = $query_data['isbn'];
        $thumbnail_url  = $query_data['thumbnail_url'];   
        
        $sql = "INSERT INTO btcapp_books (`user_id`, `title`, `isbn`, `thumbnail_url`)
                VALUES 
                    (" . $user_id . ",
                     " . $this->db->escape($title) . ",
                     " . $this->db->escape($isbn) . ",
                     " . $this->db->escape($thumbnail_url) . ")";    
        $this->db->query($sql);
    }

    /**
     * READ BOOK
     */
    function read($query_data = NULL) {
        $books = array();
        
        //$user_id = $this->session->userdata('user_id');
        $sql = "SELECT u.`id` AS uid, bb.`id`, `title`, `thumbnail_url`, `issuer_user_id`, `accepted`    
                FROM btcapp_books AS bb
                JOIN users u ON bb.user_id = u.id";        
        if ( $query_data != NULL ) {
            $sql .= " WHERE user_id = " . $this->db->escape($query_data['user_id']);
        }    
        //vdebug($sql);
        $rs = $this->db->query($sql);
        if ( ! $rs ) {
            $error = $this->db->error(); // Has keys 'code' and 'message'
        }
        foreach ($rs->result_array() as $row) {   
            $book = new Book(
                $row['id'],
                $row['uid'],
                $row['title'],
                $row['thumbnail_url'],
                $row['issuer_user_id'],
                $row['accepted']
            );
            $books[] = $book;
        }
        return $books;
    }

    /**
     * UPDATE BOOK
     */
    function update($column, $value, $data) {
        $this->db->where($column, $value);
        $result = $this->db->update('school', $data);
        // Return bool on success
        if ($result) {
            return $value;
        } else {
            return false;
        }
    }
    
    /**
     * DELETE BOOK
     */
    function delete($query_data) {
        $user_id = $this->session->userdata('user_id');
        $sql = "DELETE FROM btcapp_books
                WHERE id = ?
                AND user_id = ?";
        $rs = $this->db->query($sql, array($query_data['book_id'], $user_id));
        if ( ! $rs ) {
            $error = $this->db->error(); // Has keys 'code' and 'message'
        }
        //return $rs->result_array();
    }    
}


class Book {
    
    public $id;
    public $user_id;
    public $title;
    public $thumbnail_url;
    public $issuer_user_id;
    public $accepted;
    
    function __construct($id, $user_id, $title, $thumbnail_url, $issuer_user_id, $accepted) {
        $this->id = $id;
        $this->user_id = $user_id;
        $this->title = $title;
        $this->thumbnail_url = $thumbnail_url;
        $this->issuer_user_id = $issuer_user_id;
        $this->accepted = $accepted;
    }
            
}