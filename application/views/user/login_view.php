<?php defined('BASEPATH') OR exit('No direct script access allowed');?>    
            <div id="content" class="container">
                <?php echo isset($_SESSION['auth_message']) ? $_SESSION['auth_message'] : FALSE; ?>            
                <?php echo validation_errors(); ?>
                <form method="POST" action="<?php echo site_url('login') ?>">                   
                    <div class="form-group">
                        <label for="username">Username:</label>
                        <input type="text" class="form-control" name="username" placeholder="Username" />                        
                    </div>
                    <div class="form-group">
                        <label for="password">Password:</label>
                        <input type="password" class="form-control" name="password" placeholder="Password" />                        
                    </div> 
                    <div class="checkbox">
                        <label for="remember">
                            <input type="checkbox" name="remember" value="1">
                            <b>Remember Me</b>
                        </label>
                    </div>                    
                    <div class="form-group" style="width:150px;">
                        <button type="submit" class="btn btn-success btn-block" name="login">Login</button>                     
                    </div>                     
                </form>
            </div>

<?php /*
<div class="container">
	<?php
    echo isset($_SESSION['auth_message']) ? $_SESSION['auth_message'] : FALSE;
    ?>
    <h1>Login in</h1>
    <?php
    echo form_open();
    echo form_label('Username:','username').'<br />';
    echo form_error('username');
    echo form_input('username').'<br />';
    echo form_label('Password:', 'password').'<br />';
    echo form_error('password');
    echo form_password('password').'<br />';
    echo form_checkbox('remember','1',FALSE).' Remember me<br />';
    echo form_submit('submit','Log In');
    echo form_close();
    ?>
</div>
 * 
 */ ?>