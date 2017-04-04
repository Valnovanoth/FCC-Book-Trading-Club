<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
            <div id="content" class="container">
                <div class="col-md-12">
                    <h1>Update Profile</h1>
                    <?php echo ($subcommand == 'update-profile') ? validation_errors() : '' ?>
                    <form method="POST" action="<?php echo site_url('dashboard/user-settings/update-profile') ?>">
                        <fieldset>
                            <div class="form-group">
                                <label for="city">City</label>
                                <input name="city" type="text" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="state">State</label>
                                <input name="state" type="text" class="form-control" />
                            </div>
                            <!-- Add a State and City picker / Text plus validation -->
                            <button type="submit" class="btn btn-lg btn-primary">Save Changes</button>
                        </fieldset>
                    </form>
                </div>
                <div class="col-md-12">
                    <h1>Change Password</h1>           
                    <?php echo ($subcommand == 'change-password') ? validation_errors() : '' ?>                    
                    <form method="POST" action="<?php echo site_url('dashboard/user-settings/change-password') ?>">
                        <fieldset>
                            <div class="form-group">
                                <label for="curr-pass">Current Password</label>
                                <input name="curr_pass" type="password" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="state">New Password</label>
                                <input name="new_pass" type="password" class="form-control" />
                            </div> 
                            <button type="submit" class="btn btn-lg btn-primary">Save Changes</button>
                        </fieldset>
                    </form>
                </div>                
            </div>