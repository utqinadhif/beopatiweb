<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<div class="auth-container mg-t-50">
	<div class="text-center mg-b-30">
		<img class="img-fluid wd-50 rounded-circle mg-b-20" src="<?php echo content_url('images/logo.png');?>" alt="logo">
		<h4 class="mg-b-10 tx-semiboldX"><?php echo lang_line('signin_title');?></h4>
		<p><?php echo lang_line('signin_welcome');?></p>
	</div>
	<div class="err"><?php echo $this->cifire_alert->show('login');?></div>
	<div class="card auth-box">
		<?php echo form_open('', 'id="form-login" class="login-form" autocomplete="off"');?>
			<div class="form-group">
				<label><?php echo lang_line('username')?></label>
				<input id="username" type="text" name="<?php echo $input_uname;?>" class="form-control input-username" maxlength="20"/>
			</div>
			<div class="input-password"></div>
		<?php echo form_close();?>
	</div>
</div>
<?php echo $script;?>