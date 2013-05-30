{**
 * templates/index/site.tpl
 *
 * Copyright (c) 2003-2013 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Site index.
 *
 *}
{strip}
{if $siteTitle}
	{assign var="pageTitleTranslated" value=$siteTitle}
{/if}
{assign var="pageTitle" value="navigation.search"}

{include file="common/header.tpl"}
{/strip}

<br />

{if $intro}{$intro|nl2br}{/if}

<a name="journals"></a>

{if $useAlphalist}
	<p>{foreach from=$alphaList item=letter}<a href="{url searchInitial=$letter sort="title"}">{if $letter == $searchInitial}<strong>{$letter|escape}</strong>{else}{$letter|escape}{/if}</a> {/foreach}<a href="{url}">{if $searchInitial==''}<strong>{translate key="common.all"}</strong>{else}{translate key="common.all"}{/if}</a></p>
{/if}

<link href="{$baseUrl}/styles/imageSlider/js-image-slider.css" rel="stylesheet" type="text/css" />
<script src="{$baseUrl}/styles/imgaeSlider/js-image-slider.js" type="text/javascript"></script>
<link href="{$baseUrl}/styles/generic.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
        //The following script is for the group 2 navigation buttons.
        function switchAutoAdvance() {
            imageSlider.switchAuto();
            switchPlayPauseClass();
        }
        function switchPlayPauseClass() {
            var auto = document.getElementById('auto');
            var isAutoPlay = imageSlider.getAuto();
            auto.className = isAutoPlay ? "group2-Pause" : "group2-Play";
            auto.title = isAutoPlay ? "Pause" : "Play";
        }
        switchPlayPauseClass();
</script>

<div id="sliderFrame">
        <div id="slider">
            <img src="{$baseUrl}/styles/images/image-slider-1.jpg" alt="#htmlcaption1" />
            <img src="{$baseUrl}/styles/images/image-slider-2.jpg" alt="#htmlcaption2" />
            <img src="{$baseUrl}/styles/images/image-slider-3.jpg" alt="#htmlcaption3" />
            <img src="{$baseUrl}/styles/images/image-slider-4.jpg" alt="#htmlcaption4" />
        </div>
        <!--Custom navigation buttons on both sides-->
        <div class="group1-Wrapper">
            <a onclick="imageSlider.previous()" class="group1-Prev"></a>
            <a onclick="imageSlider.next()" class="group1-Next"></a>
        </div>
    </div>
    


 <div id="titlejournal"> JOURNALS </div>

<div style="
    padding-left: 15px;
    padding-top: 20px;
">
{iterate from=journals item=journal}
	{if $site->getSetting('showThumbnail')}
		{assign var="displayJournalThumbnail" value=$journal->getLocalizedSetting('journalThumbnail')}
		<div style="clear:left;">
		{if $displayJournalThumbnail && is_array($displayJournalThumbnail)}
			{assign var="altText" value=$journal->getLocalizedSetting('journalThumbnailAltText')}
			<div class="homepageImage"><a href="{url journal=$journal->getPath()}" class="action"><img src="{$journalFilesPath}{$journal->getId()}/{$displayJournalThumbnail.uploadName|escape:"url"}" {if $altText != ''}alt="{$altText|escape}"{else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if} /></a></div>
		{/if}
		</div>
	{/if}


	{if $site->getSetting('showTitle')}
		<h3><b>{$journal->getLocalizedTitle()|escape}</b></h3>
	{/if}
	{if $site->getSetting('showDescription')}
		{if $journal->getLocalizedDescription()}
			<p>{$journal->getLocalizedDescription()|nl2br}</p>
		{/if}
	{/if}
	<p><a href="{url journal=$journal->getPath()}" class="action">{translate key="site.journalView"}</a> | <a href="{url journal=$journal->getPath() page="issue" op="current"}" class="action">{translate key="site.journalCurrent"}</a> | <a href="{url journal=$journal->getPath() page="user" op="register"}" class="action">{translate key="site.journalRegister"}</a></p> </br>

{/iterate}
{if $journals->wasEmpty()}
	{translate key="site.noJournals"}
{/if}
</div>
<div id="journalListPageInfo">{page_info iterator=$journals}</div>
<div id="journalListPageLinks">{page_links anchor="journals" name="journals" iterator=$journals}

<!--

-->
 <!-- ===================================== -->

{include file="common/footer.tpl"}

