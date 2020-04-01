<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<div class="auth-container mg-t-50">
	<div class="text-center mg-b-30">
		<img class="img-fluid wd-50 rounded-circle mg-b-20" src="<?php echo content_url('images/logo.png');?>" alt="Logo">
		<h4 class="mg-b-10 tx-semiboldX"><?php echo lang_line('forgot_title');?></h4>
		<p><?php echo lang_line('forgot_content');?></p>
	</div>
	<div class="err"><?php echo $this->cifire_alert->show('forgot');?></div>
	<div class="card auth-box text-center">
		<?php echo form_open('', 'id="form-login" class="login-form" autocomplete="off"');?>
			<div class="form-group">
				<label><?php echo lang_line('enter_your_email')?></label>
				<input type="email" name="email" class="form-control" maxlength="80" placeholder="<?php echo lang_line('enter_your_email');?>"/>
			</div>
			<button type="submit" class="btn btn-brand btn-block" type="submit">
				<i class="cificon licon-send mr-2"></i>
				<?php echo lang_line('button_send');?>
			</button>
			<p class="mg-t-20 mg-b-0"><a href="<?php echo admin_url('login');?>"><?php echo lang_line('back_to_login');?></a></p>
		<?php echo form_close();?>
	</div>
</div>