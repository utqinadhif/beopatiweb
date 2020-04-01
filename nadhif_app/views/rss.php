<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0"
	xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:sy="http://purl.org/rss/1.0/modules/syndication/"
	xmlns:admin="http://webns.net/mvcb/"
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:content="http://purl.org/rss/1.0/modules/content/">
<channel>
    <title><?php echo $feed_title;?></title>
    <link><?php echo $feed_link;?></link>
    <description><?php echo $feed_description;?></description>
    <dc:language><?php echo $feed_language;?></dc:language>
    <dc:rights>Copyright <?php echo date('Y');?>. <?php echo get_setting('web_name');?>. All Rights Reserved.</dc:rights>
    <dc:creator><?php echo $feed_creator;?></dc:creator>
    <dc:rights><?php echo $feed_copyright;?></dc:rights>
	<admin:generatorAgent rdf:resource="https://www.alweak.com/" />
	<?php foreach ($feed_datas as $res): ?>
    <item>
        <title><?php echo $res['post_title'];?></title>
        <link><?php echo post_url($res['post_seotitle']);?></link>
        <guid><?php echo post_url($res['post_seotitle']);?></guid>
        <description><![CDATA[ <?php echo html_entity_decode($res['post_content']); ?> ]]></description>
        <enclosure url="<?php echo post_images($res['post_picture'],'',true);?>" length="49398" type="image/jpeg"/>
        <pubDate><?php echo ci_date($res['datepost'].$res['timepost'], 'D d F Y | h:i A') ?></pubDate>
        <dc:creator><?php echo $res['user_name'];?></dc:creator>
    </item>
	<?php endforeach ?>
</channel>
</rss>