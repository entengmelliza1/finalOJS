<?php /* Smarty version 2.6.26, created on 2013-05-08 05:06:48
         compiled from controllers/extrasOnDemand.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'translate', 'controllers/extrasOnDemand.tpl', 19, false),)), $this); ?>
<script type="text/javascript">
	// Initialise JS handler.
	$(function() {
		$('#<?php echo $this->_tpl_vars['id']; ?>
').pkpHandler(
			'$.pkp.controllers.ExtrasOnDemandHandler');
	});
</script>
<div id="<?php echo $this->_tpl_vars['id']; ?>
" class="pkp_controllers_extrasOnDemand">
	<div class="toggleExtras">
		<span class="ui-icon"></span>
		<span class="toggleExtras-inactive"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => $this->_tpl_vars['moreDetailsText']), $this);?>
</span>
		<span class="toggleExtras-active"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => $this->_tpl_vars['lessDetailsText']), $this);?>
</span>
	</div>
	<div style="clear:both;"></div>
	<div class="extrasContainer">
		<?php echo $this->_tpl_vars['extraContent']; ?>

	</div>
</div>