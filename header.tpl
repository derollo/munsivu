<!DOCTYPE html>
 <html lang="en">
    <head>
		{include file="$template/hostx_includes/seo-meta-tags.tpl"}
		{include file="$template/includes/head.tpl"}
		{include file="$template/hostx_includes/seo-trackers.tpl"}
		{include file="$template/hostx_includes/page-css.tpl"}
		{$headoutput} 
		{include file="$template/hostx_includes/mega-menu-hover-setting.tpl"}
    </head>
     <body data-phone-cc-input="{$phoneNumberInputStyle}" class="currency_format_{$currency_format}">
		{include file="$template/hostx_includes/mobile-menu.tpl"}
     <div class="right-content">
		<div class="loader-wrapper" style="display: none;"></div>
        {$headeroutput}
		{include file="$template/hostx_includes/top-most-header.tpl"}
		{include file="$template/hostx_includes/top-menu-header.tpl"}
        {if $templatefile == 'homepage' || $templatefile == 'clientregister' || $templatefile == 'login'  || $templatefile == 'password-reset-container' || $templatefile == 'email-prompt' || $templatefile == 'logout' || $templatefile == 'contact' || $sidebarHostxRemove == 'true' || $templatefile == 'error/page-not-found' || $templatefile|substr:0:6|trim eq 'store/' && $templatefile neq 'store/ox/manage'}
			{include file="$template/hostx_includes/login-register-logout-psw-view.tpl"}
        {else}
			<section id="main-body" class="clientarea {$templatefile} {if $inShoppingCart}wgs-in-cart{/if}">
				<div class="container{if $skipMainBodyContainer}-fluid without-padding{/if} container-hostx-body">
					<div class="row">
					{if !$cartpage && $templatefile neq 'domain-renewals' && $loggedin}
						{if $hostx_theme_settings.enable_primary_sidebar_left neq 'on'}
						<div class="custom-primary-side-bar-icn">
								<nav id="menu-sidebar-hostx" class="sidebar-hostx sidebar-left-hostx {if $primarySideBarStatus eq '' ||  $primarySideBarStatus eq 'open'}left-open-hostx{/if}">
									<div class="inner-outer-div">
										<ul class="nav sidenav-list">
											{include file="$template/hostx_includes/side-menu-custom.tpl"}
										</ul>
									</div>
								</nav>
						</div>
						{/if}
						{if $hostx_theme_settings.enable_secondary_sidebar_right neq 'on'}
							{if !$inShoppingCart && ($secondarySidebar->hasChildren() || $primarySidebar->hasChildren())}
								<div class="custom-side-side-bar-icn">
									<nav id="menu-sidebar-hostx-sec" class="sidebar-hostx-sec sidebar-left-hostx-sec {if $secondarySideBarStatus eq '' ||  $secondarySideBarStatus eq 'open'}left-open-hostx-sec{/if}">
										<div class="inner-outer-div">
											<ul class="nav nav-pills nav-stacked">
												{include file="$template/includes/sidebar.tpl" sidebar=$primarySidebar}
												{include file="$template/includes/sidebar.tpl" sidebar=$secondarySidebar}
												{include file="$template/hostx_includes/second-side-menu-helper.tpl"}
											</ul>
										</div>
									</nav>
								</div>
							{/if}
						{/if}
					{/if}
						<!-- Container for main page display content -->
						<div class="col-xs-12 main-content">
							<div class="row">
								{include file="$template/includes/validateuser.tpl"}
								{include file="$template/includes/verifyemail.tpl"}
							</div>
							<div class="right">
								{if !$primarySidebar->hasChildren() && !$showingLoginPage && !$inShoppingCart && $templatefile != 'homepage' && !$skipMainBodyContainer}
									 {include file="$template/includes/pageheader.tpl" title=$displayTitle desc=$tagline showbreadcrumb=true}
								{/if}
								{if $primarySidebar->hasChildren() && !$skipMainBodyContainer}               
									 {include file="$template/includes/pageheader.tpl" title=$displayTitle desc=$tagline showbreadcrumb=true}                
								{/if}
        {/if}