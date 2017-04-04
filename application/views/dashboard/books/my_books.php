<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
            <div id="content" class="container">
                
                <?php $this->load->view('templates/_parts/auth_books_controls_view') ?>
                
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">My Books:</h1>                        
                        <form method="POST" class="form-inline" action="<?php echo site_url('dashboard/my-books') ?>">
                            <fieldset>
                                <div class="form-group">
                                    <input name="title" type="text" class="form-control" placeholder="Add Book" />                                                                        
                                </div>
                                <button name="add_book_submit" type="submit" class="btn btn-primary">Add</button>
                            </fieldset>
                        </form>
                        <br/>
                        <?php echo validation_errors() ?>
                    </div>
                    <div id="books-list" class="col-md-12">
                        <?php 
                        if (isset($my_books)) {
                            foreach ($my_books as $book) { ?>
                                <div class="book col-md-1 text-center vertical-align">                                                                          
                                    <?php if ($book->thumbnail_url == '') { ?>
                                        <p class="book-title"><?php echo $book->title ?></p>  
                                    <?php } else { ?>
                                        <img class="book-thumbnail" src="<?php echo $book->thumbnail_url ?>" /> 
                                    <?php } ?>
                                    <i class="book-control book-delete fa fa-times red"></i>
                                    <span class="id hidden-data" style="display:none;"><?php echo $book->id ?></span>
                                </div>
                            <?php                             
                            } 
                        } ?>
                    </div>
                </div>
                
                <script type="text/javascript" src="<?php echo site_url('assets/js/dashboard/googlebooks-viewers.js') ?>"></script>
                <script type="text/javascript">
                    // Book Delete
                    $( ".book-delete" ).click( function() {                       
                        var parent = $( this ).parent();
                        var id = parent.find( "span.id.hidden-data" ).html();
                        $.ajax({
                            type: "POST",
                            url: "<?php echo site_url('dashboard/ajax-delete-book') ?>",
                            dataType: "text",
                            data: {
                                id: id
                            },
                            success: function(result) {
                                //alert(result);
                                parent.remove();
                            },
                            error: function(xhr, status, error) {
                                //alert(error);
                            }
                        });
                    });                    
                </script>                
            </div>