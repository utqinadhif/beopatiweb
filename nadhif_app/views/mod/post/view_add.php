<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<div class="page-inner">
	<div class="d-sm-flex align-items-center justify-content-between pd-b-20">
		<div class="pageheader pd-t-20 pd-b-0">
			<div class="d-flex justify-content-between">
				<div class="clearfix">
					<div class="breadcrumb pd-0 pd-b-10 mg-0">
						<a href="#" class="breadcrumb-item"><?php echo lang_line('ui_dashboard');?></a>
						<a href="#" class="breadcrumb-item"><?php echo lang_line('ui_content');?></a>
						<a href="#" class="breadcrumb-item"><?php echo lang_line('mod_title');?></a>
						<a href="#" class="breadcrumb-item"><?php echo lang_line('mod_title_add');?></a>
					</div>
					<h4 class="pd-0 mg-0 tx-20 tx-dark tx-spacing--1"><?php echo lang_line('mod_title_add');?></h4>
				</div>
			</div>
		</div>
		<div class="mg-t-15">
			<button type="button" class="btn btn-sm pd-x-15 btn-white btn-uppercase" onclick="window.location='<?php echo admin_url($this->mod);?>'"><i data-feather="arrow-left" class="mr-2"></i><?php echo lang_line('button_back');?></button>
		</div>
	</div>

	<div class="content">
		<?php echo form_open('','id="form_add" autocomplete="off"');?>
		<div class="content-inner">
			<div class="row">
				<div class="col-md-9">
					<!-- Title -->
					<div class="form-group">
						<label><?php echo lang_line('_title');?> <span class="text-danger">*</span></label>
						<input id="title" type="text" name="title" class="form-control" />
					</div>
					<!--/ Title -->

					<!-- seotitle -->
					<div class="form-group mg-b-30">
						<label><?php echo lang_line('_seotitle');?> <span class="text-danger">*</span></label>
						<input id="seotitle" type="text" name="seotitle" class="form-control" />
					</div>
					<!--/ seotitle -->

					<!-- Content -->
					<div class="form-group">
						<label><?php echo lang_line('_content');?> <span class="text-danger">*</span></label>
						<span class="btn-group pull-right">
							<button type="button" id="tiny-text" class="btn btn-xs btn-white"><?php echo lang_line('button_text');?></button type="button">
							<button type="button" id="tiny-visual" class="btn btn-xs btn-white"><?php echo lang_line('button_visual');?></button type="button">
						</span>
						<textarea id="Content" name="content" class="form-control" rows="20"></textarea>
					</div>
					<!--/ Content -->
				</div>

				<div class="col-md-3">
					<!-- Category -->
					<div class="form-group">
						<label><?php echo lang_line('_category');?> <span class="text-danger">*</span></label>
						<select name="category" class="select2 form-control" data-placeholder="<?php echo lang_line('_category');?>">
							<?php
								foreach ($all_category as $category) {
										$selected = ($category['id']=='1'?'selected':'');
									echo '<option value="'.encrypt($category['id']).'" '.$selected.'>'.$category['title'].'</option>';
								}
							?>
						</select>
					</div>
					<!--/ Category -->

					<!-- tags -->
					<div class="form-group">
						<label><?php echo lang_line('_tags');?></label>
						<input id="tagsjs" type="text" name="tags" class="form-control" />
					</div>
					<!--/ tags -->

					<!-- picture -->
					<div class="form-group">
						<label><?php echo lang_line('_picture');?></label>
						<img id="imgprv" class="img-thumbnail" src="<?php echo post_images('', '', TRUE);?>" style="width:100%;">
						<div class="btn-group mt-2">
							<a id="filemanager" href="<?php echo content_url('plugins/filemanager/dialog.php?type=1&relative_url=1&field_id=picture&sort_by=date&descending=1&akey='.fmkey());?>" class="btn btn-xs btn-white"><i class="cificon licon-folder-plus"></i> <?php echo lang_line('button_browse');?></a>
							<button type="button" id="delpict" class="btn btn-xs btn-white"><i class="cificon licon-trash-2"></i> <?php echo lang_line('button_delete');?></button>
						</div>
						<input id="picture" type="hidden" name="picture"/>
					</div>
					<!--/ picture -->
					
					<!-- Image descrption -->
					<div class="mt-3 form-group">
						<label><?php echo lang_line('_caption');?></label>
						<textarea name="image_caption" class="form-control" maxlength="100"></textarea>
					</div>
					<!--/ Image descrption -->
					<div class="row">
						<div class="col-lg-6">
							<!-- date -->
							<div class="form-group">
								<label><?php echo lang_line('_date');?></label>
								<input type="text" id="publishdate" name="datepost" class="form-control" aria-label="Date" aria-describedby="basic-date" value="<?php echo date('Y-m-d');?>" required>
							</div>
							<!--/ date -->
						</div>
						<div class="col-lg-6">
							<!-- time -->
							<div class="form-group">
								<label><?php echo lang_line('_time');?></label>
								<input type="text" id="publishtime" name="timepost" class="form-control" aria-label="Time" aria-describedby="basic-time" value="<?php echo date('H:i:s');?>" required>
							</div>
							<!--/ time -->
						</div>
					</div>

					<div class="row">
						<div class="col-md-12 col-lg-6">
							<!-- Headline -->
							<div class="form-group">
								<label><?php echo lang_line('_headline');?></label>
								<select name="headline" class="select-bs form-control">
									<option value="N"><?php echo lang_line('ui_no');?></option>
									<option value="Y"><?php echo lang_line('ui_yes');?></option>
								</select>
							</div>
							<!--/ Headline -->
						</div>
						<div class="col-md-12 col-lg-6">
							<!-- Comment -->
							<div class="form-group">
								<label><?php echo lang_line('_comment');?></label>
								<select name="comment" class="select-bs form-control">
									<option value="Y"><?php echo lang_line('ui_active');?></option>
									<option value="N"><?php echo lang_line('ui_deactive');?></option>
								</select>
							</div>
							<!--/ Comment -->
						</div>
						<div class="col-md-12">
							<!-- Status -->
							<div class="form-group">
								<label><?php echo lang_line('_status');?> <span class="text-danger">*</span></label>
								<select name="status" class="select-bs form-control">
									<option value="Y"><?php echo lang_line('ui_publish');?></option>
									<option value="N"><?php echo lang_line('ui_draft');?></option>
								</select>
							</div>
							<!--/ Status -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="content-footer">
			<button type="submit" class="submit_add btn btn-lg btn-primary mr-2"><i id="submit_icon" class="cificon licon-send mr-2"></i><?php echo lang_line('button_submit');?></button>
		</div>
		<?php echo form_close();?>
	</div>
</div>