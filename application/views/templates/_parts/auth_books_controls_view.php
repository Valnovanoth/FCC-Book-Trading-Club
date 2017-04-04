<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
                <!-- Output -->
                <button id="output-trade-req-btn" name="output-trade-req" class="btn btn-success">
                    Your trade requests (<?php echo $out_trade_req['count'] ?> outstanding)
                </button>
                <!-- Input -->
                <button id="input-trade-req-btn" name="input-trade-req" class="btn btn-primary">
                    Trade requests for you (<?php echo $in_trade_req['count'] ?> unapproved)
                </button>

                <!-- Output trade requests -->
                <div id="output-trade-req-div" class="action-div hidden">
                    <div class="col-md-12">
                        <h1 class="page-header">Your outstanding requests:</h1>
                        <?php foreach ($out_trade_req['rs'] as $out_tr_req) { ?>
                            <ul class="nav nav-tabs nav-stacked col-md-4">
                                <li>
                                    <a>
                                        <?php echo $out_tr_req['title'] ?>
                                        <button class="cancel close"><i class="fa fa-times red"></i></button>
                                        <span class="id hidden-data" style="display:none;"><?php echo $out_tr_req['id'] ?></span>
                                    </a>                                    
                                </li>
                            </ul>
                        <?php } ?>
                    </div>
                </div>
                <!-- Input trade requests -->
                <div id="input-trade-req-div" class="action-div hidden">
                    <div id="pending" class="col-md-12">
                        <h1 class="page-header">Requests from other users:</h1>
                        <?php foreach ($in_trade_req['rs'] as $in_tr_req) { 
                            // Pending requests only
                            if ($in_tr_req['accepted'] == 0) { ?>
                                <ul class="nav nav-tabs nav-stacked col-md-4">
                                    <li>
                                        <a>
                                            <?php echo $in_tr_req['title'] ?>
                                            <button class="accept close"><i class="fa fa-check green"></i></button>
                                            <button class="cancel close"><i class="fa fa-times red"></i></button>                                        
                                            <span class="id hidden-data" style="display:none;"><?php echo $in_tr_req['id'] ?></span>
                                        </a>                                        
                                    </li>
                                </ul>
                            <?php
                            }
                        } ?>                        
                    </div>
                    <div id="accepted" class="col-md-12">
                        <h1 class="page-header">Requests you've approved:</h1>
                        <?php foreach ($in_trade_req['rs'] as $in_tr_req) { 
                            // Accepted requests only
                            if ($in_tr_req['accepted'] == 1) { ?>
                                <ul class="nav nav-tabs nav-stacked col-md-4">
                                    <li>
                                        <a>
                                            <?php echo $in_tr_req['title'] ?>
                                            <button class="cancel close"><i class="fa fa-times red"></i></button>                                        
                                            <span class="id hidden-data" style="display:none;"><?php echo $in_tr_req['id'] ?></span>
                                        </a>                                        
                                    </li>
                                </ul>
                            <?php
                            }
                        } ?>                         
                    </div>                    
                </div>
                
                <!-- Buttons click logic -->
                <script type="text/javascript" src="<?php echo site_url('assets/js/dashboard/auth_books_controls.js') ?>"></script>