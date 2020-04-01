<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

<meta property="business:contact_data:street_address" content="STREET_ADDRESS"/>
<meta property="business:contact_data:locality" content="CITY_NAME"/>
<meta property="business:contact_data:postal_code" content="POSTAL_CODE"/>
<meta property="business:contact_data:country_name" content="<?php echo get_setting('country');?>"/>
<meta property="business:contact_data:email" content="<?php echo get_setting('web_email');?>"/>
<meta property="business:contact_data:phone_number" content="08123456789"/>
<meta property="business:contact_data:website" content="<?php echo get_setting('web_url');?>"/>

<meta property="og:type" content="website"/> <!-- option : article, website, blog, profile -->
<meta property="og:title" content="<?php echo $this->meta_title;?>"/>
<meta property="og:description" content="<?php echo $this->meta_description;?>"/>
<meta property="og:image" content="<?php echo $this->meta_image;?>"/>
<meta property="og:url" content="<?php echo selft_url();?>"/>
<meta property="og:site_name" content="<?php echo get_setting('web_name');?>"/>

<meta property="fb:admins" content="FACEBOOK_ID"/>
<meta property="profile:first_name" content="FACEBOOK_FIRST_NAME"/>
<meta property="profile:last_name" content="FACEBOOK_LAST_NAME"/>
<meta property="profile:username" content="FACEBOOK_USERNAME"/>

<meta itemprop="name" content="<?php echo $this->meta_title;?>"/>
<meta itemprop="description" content="<?php echo $this->meta_description;?>"/>
<meta itemprop="image" content="<?php echo $this->meta_image;?>"/>

<meta property="place:location:latitude" content="<?php echo get_setting('map_latitude');?>"/>
<meta property="place:location:longitude" content="<?php echo get_setting('map_longitude');?>"/>