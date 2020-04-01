<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<div class="col-md-12 clearfix mb-5 left-content">
	<div class="box-category">
		<div class="post-head">
			<h4><i class="cificon licon-search mr-1"></i> Search Result</h4>
		</div>
		<?php
		if (!$search_results) {
			?>
			<div class="post-inner clearfix">
				No data
			</div>
			<?php
		} else {
			?>
			<div class="post-inner clearfix">
				<?php
				foreach ($search_results as $res) {
					?>
					<div class="post-lists">
						<div class="row">
							<div class="col-md-2">
								<div class="image-warper">
									<a href="<?php echo post_url($res['post_seotitle']);?>" title="<?php echo $res['post_title'];?>">
										<img  src="<?php echo post_images($res['picture'],'medium',TRUE);?>" alt="<?php echo $res['post_title'];?>">
									</a>
								</div>
							</div>
							<div class="col-md-10">
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
									<p class="description"><?php echo cut($res['content'],200);?>...</p>
								</div>
							</div>
						</div>
					</div>
					<?php
				}
				?>
			</div>
			<div class="post-footer">
				<ul class="pagination">
					<?php echo $page_link;?>
				</ul>
			</div>
			<?php
		}
		?>
	</div>
</div>