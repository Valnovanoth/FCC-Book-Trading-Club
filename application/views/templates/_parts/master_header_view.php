<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<!DOCTYPE html>
<html>
<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?><!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">     
        <!-- BOOTSTRAP - Mobile support -->
        <meta name="viewport" content="width=device-width, initial-scale=1">  
        <!-- ??? -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />        
        <!-- Title and description -->
        <title><?php echo $page_title;?></title>
        <meta name="description" value="<?php echo $page_description;?>" />
        <!-- Custom CSS -->
        <link rel="stylesheet" href="<?php echo site_url('assets/css/common.css') ?>">
        <?php if (isset($css) and file_exists('assets/css/' . $css . '.css')) { ?>
            <link rel="stylesheet" href="<?php echo site_url('assets/css/' . $css . '.css') ?>">
        <?php } ?>
        <!-- !!! JQUERY - library !!! (don't load inside head) -->
        <script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
        <!-- Google Books API -->
        <script type="text/javascript" src="https://www.google.com/books/jsapi.js"></script>
        <script type="text/javascript">
            google.books.load();
        </script>
        <!-- jQuery workaround in order to use it before actually loading it -->
        <!--<script>(function(w,d,u){w.readyQ=[];w.bindReadyQ=[];function p(x,y){if(x=="ready"){w.bindReadyQ.push(y);}else{w.readyQ.push(x);}};var a={ready:p,bind:p};w.$=w.jQuery=function(f){if(f===d||f===u){return a}else{p(f)}}})(window,document)</script>-->
        <?php echo $before_closing_head;?>
    </head>

    <body>        
        
        <!-- Outer -->
        <div id="outer" class="container">     
            
            <!-- Header -->
            <header>
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <div class="collapse navbar-collapse navbar-header">
                            <ul class="nav navbar-nav">
                                
                                <!--<li class="active"><a href="#">Home</a></li>-->
                                <li <?php echo ($pagename == 'home') ? ' class="active"' : '' ?>>
                                    <?php /* <a class="navbar-brand" href="javascript:void(0);">bookjump</a> */ ?>
                                    <a class="navbar-brand" href="<?php echo site_url('dashboard') ?>">bookjump</a>
                                </li>
                                <li>
                                    <?php if ( strcmp($this_class, 'Auth_Controller') == 0 ) { ?>
                                        <a>Logged in as : <b><?php echo $username ?></b></a>
                                    <?php } ?>
                                </li>                                
                            </ul>                                                                                    
                        </div>
                        <div class="collapse navbar-collapse" id="nav-items">
                            <ul class="nav navbar-nav navbar-right">
                                <?php if ( strcmp($this_class, 'Public_Controller') == 0 ) {
                                    $this->load->view('templates/_parts/public_master_header_menu');
                                } else if ( strcmp($this_class, 'Auth_Controller') == 0 ) {
                                    $this->load->view('templates/_parts/auth_master_header_menu');
                                } ?>                               
                            </ul>
                        </div>
                    </div>
                </nav>
                <?php if (! isset($jumbotron)) { ?>
                    <div class="jumbotron">
                        <div class="container text-center">
                            <h1>BookJump</h1>
                            <p>The first rule of bookjump is don't talk about bookjump.</p>
                            <span style="font-size: 60pt" class="glyphicon glyphicon-leaf" aria-hidden="true"></span>
                        </div>
                    </div>    
                <?php } ?>
            </header>
