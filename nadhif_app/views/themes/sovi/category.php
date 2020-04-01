<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<!-- left content -->
<div class="col-lg-8 col-md-12 clearfix mb-5 left-content">
	<div class="box-category">
		<div class="post-head">
			<h4><i class="cificon licon-folder mr-1"></i> <?php echo $result_category['title']?></h4>
		</div>
		<div class="post-inner clearfix">
			<?php
			foreach($category_post as $res) {
				?>
				<div class="post-lists">
					<div class="row">
						<div class="col-md-4">
							<div class="image-warper">
								<a href="<?php echo post_url($res['post_seotitle']);?>" title="<?php echo $res['post_title'];?>">
									<img  src="<?php echo post_images($res['picture'],'medium',TRUE);?>" alt="<?php echo $res['post_title'];?>">
								</a>
							</div>
						</div>
						<div class="col-md-8">
							<div class="media-body post-info">
								<h5>
									<a href="<?php echo post_url($res['post_seotitle']);?>" title="<?php echo $res['post_title'];?>"><?php echo $res['post_title'];?></a>
								</h5>
								<!-- meta -->
								<ul class="entry-meta clearfix">
									<li><i class="cificon licon-calendar"></i> <?php echo ci_date($res['datepost'].$res['timepost'], 'l, d F Y');?></li>
									<li><i class="cificon licon-folder"></i> <a href="<?php echo site_url('category/'.$res['category_seotitle']);?>"><?php echo $res['category_title'];?></a></li>
								</ul>
								<!--/ meta -->
								<p class="description"><?php echo cut($res['content'],150);?>...</p>
								<a href="<?php echo post_url($res['post_seotitle']);?>" class="readmore">Read More</a>
							</div>
						</div>
					</div>
				</div>
				<?php
			}
			?>
		</div>
		<div class="post-footer">
			<div class="">
				<ul class="pagination">
					<?php echo $page_link;?>
				</ul>
			</div>
		</div>
	</div>
</div>
<!--/ left content -->
<!-- sidebar -->
<div class="col-lg-4 col-md-12 clearfix mb-5 sidebar">
	<?php $this->CI->_layout('sidebar'); ?>
</div>
<!--/ sidebar -->