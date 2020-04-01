<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<div class="page-inner">
	<div class="d-sm-flex align-items-center justify-content-between pd-b-20">
		<div class="pageheader pd-t-20 pd-b-0">
			<div class="d-flex justify-content-between">
				<div class="clearfix">
					<div class="breadcrumb pd-0 pd-b-10 mg-0">
						<a href="#" class="breadcrumb-item"><?php echo lang_line('ui_dashboard');?></a>
						<a href="#" class="breadcrumb-item"><?php echo lang_line('mod_title');?></a>
						<a href="#" class="breadcrumb-item"><?php echo lang_line('mod_title_edit');?></a>
					</div>
					<h4 class="pd-0 mg-0 tx-20 tx-dark tx-spacing--1"><?php echo lang_line('mod_title_edit');?></h4>
				</div>
			</div>
		</div>
		<div class="mg-t-15">
			<button type="button" class="btn btn-sm pd-x-15 btn-white btn-uppercase" onclick="window.location='<?php echo admin_url($this->mod);?>'"><i data-feather="arrow-left" class="mr-2"></i><?php echo lang_line('button_back');?></button>
		</div>
	</div>

	<div class="card mg-b-50">
		<?php
			echo form_open_multipart('', 'id="form_update_user" autocomplete="off"');
			echo form_hidden('act', 'update');
			echo form_hidden('pk', encrypt($res_user['u_id']));
		?>
		<div class="card-body">
			<div class="row">
				<!-- Group -->
				<div class="col-md-6 col-lg-3">
					<div class="form-group">
						<label><?php echo lang_line('_group');?> <span class="text-danger">*</span></label>
						<select class="select2" name="group"  data-placeholder="group" required>
							<option value="<?php echo $res_user['g_pk'];?>"><?php echo $res_user['g_title']?></option>
							<?php 
								$groups = $this->CI->user_model->data_groups();
								foreach ($groups as $resGroup) {
									if ($resGroup['pk']==$res_user['g_pk']) continue;
									echo '<option value="'. $resGroup['pk'] .'">'. $resGroup['title'] .'</option>';
								}
							?>
						</select>
					</div>
				</div>
				<!--/ Group -->

				<!-- Username -->
				<div class="col-md-6 col-lg-3">
					<div class="form-group">
						<label><?php echo lang_line('_username');?> <span class="text-danger">*</span></label>
						<input type="text" class="form-control" value="<?php echo $res_user['username'];?>" disabled />
					</div>
				</div>
				<!--/ Username -->

				<!-- Email -->
				<div class="col-md-6 col-lg-3">
					<div class="form-group">
						<label><?php echo lang_line('_email');?> <span class="text-danger">*</span></label>
						<input type="text" name="email" class="form-control" value="<?php echo $res_user['email'];?>" required/>
					</div>
				</div>
				<!--/ Email -->

				<!-- Password -->
				<div class="col-md-6 col-lg-3">
					<div class="form-group">
						<label><?php echo lang_line('_password');?> <span class="text-danger">*</span></label>
						<input type="password" name="input_password" class="form-control"/>
						<small class="text-muted"><em><?php echo lang_line('_pass_placholder');?></em></small>
					</div>
				</div>
				<!--/ Password -->
				
				<!-- Name -->
				<div class="col-md-6 col-lg-3">
					<div class="form-group">
						<label><?php echo lang_line('_name');?> <span class="text-danger">*</span></label>
						<input type="text" name="name" class="form-control" value="<?php echo $res_user['name'];?>" required/>
					</div>
				</div>
				<!--/ Name -->

				<!-- Birthday -->
				<div class="col-md-6 col-lg-3">
					<div class="form-group">
						<label><?php echo lang_line('_birthday');?></label>
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-date"><i class="fa fa-calendar"></i></span>
							</div>
							<input type="text" id="input-datepicker" name="birthday" class="form-control" aria-label="Date" aria-describedby="basic-date" value="<?php echo $res_user['birthday'];?>" required />
						</div>
					</div>
				</div>
				<!--/ Birthday -->

				<!-- Gender -->
				<div class="col-md-6 col-lg-3">
					<div class="form-group">
						<label><?php echo lang_line('_gender');?></label>
						<select class="select-bs form-control" name="gender"  data-placeholder="<?php echo lang_line('_gender');?>">
							<option value="<?php echo $res_user['gender'];?>" style="display:none;"><?php echo ($res_user['gender']=='M' ? lang_line('ui_male') : lang_line('ui_female'));?></option>
							<option value="M"><?php echo lang_line('ui_male');?></option>
							<option value="F"><?php echo lang_line('ui_female');?></option>
						</select>
					</div>
				</div>
				<!--/ Gender -->

				<!-- Telephone -->
				<div class="col-md-6 col-lg-3">
					<div class="form-group">
						<label><?php echo lang_line('_tlpn');?></label>
						<input type="text" name="tlpn" class="form-control" value="<?php echo $res_user['tlpn'];?>" />
					</div>
				</div>
				<!--/ Telephone -->

				<!-- About -->
				<div class="col-md-6">
					<div class="form-group">
						<label><?php echo lang_line('_about');?></label>
						<textarea name="about" class="form-control" rows="5"><?php echo $res_user['about'];?></textarea>
					</div>
				</div>
				<!--/ About -->

				<!-- Address -->
				<div class="col-md-6">
					<div class="form-group">
						<label><?php echo lang_line('_address');?></label>
						<textarea name="address" class="form-control" rows="5"><?php echo $res_user['address'];?></textarea>
					</div>
				</div>
				<!--/ Address -->

				<!-- Status -->
				<div class="col-md-6 col-lg-3">
					<div class="form-group">
						<label><?php echo lang_line('_status');?></label>
						<select class="select-bs form-control" name="active">
							<option value="<?php echo $res_user['active'] ;?>" style="display:none;"><?php echo ($res_user['active'] == 'Y' ? lang_line('ui_active') : lang_line('ui_deactive'));?></option>
							<option value="Y"><?php echo lang_line('ui_active');?></option>
							<option value="N"><?php echo lang_line('ui_deactive');?></option>
						</select>
					</div>
				</div>
				<!--/ Status -->

				<!-- Photo -->
				<div class="col-md-6 col-lg-5">
					<div class="form-group">
						<label><?php echo lang_line('_photo');?></label>
						<div class="custom-file">
							<input type="file" class="custom-file-input" id="upload-image" name="fupload"/>
							<label class="custom-file-label" for="upload-image" browse-label="<?php echo lang_line('button_browse');?>"><?php echo lang_line('button_choose_file');?></label>
						</div>
					</div>
				</div>
				<!--/ Photo -->

				<div class="col-md-6 col-lg-3">
					<div class="form-group text-center">
						<label>&nbsp;</label>
						<div>
							<img id="image-preview" src="<?php echo user_photo($res_user['photo']);?>" class="thumbnail us-avatar" style="border:1px solid #ddd;padding:5px;border-radius:4px;width:100px;">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="card-footer">
			<button type="submit" class="btn btn-lg btn-primary submit_update"><i id="submit_icon" class="fa fa-save mr-2"></i><?php echo lang_line('button_save');?></button>
		</div>
		<?php echo form_close();?>
	</div>
</div>
