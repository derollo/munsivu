<div class="client_affiliate_signup">
	<div class="shared-hosting">
		{if $affiliatesystemenabled}
			{include file="$template/includes/alert.tpl" type="info" title=$LANG.affiliatesignuptitle msg=$LANG.affiliatesignupintro|cat:'<br />' textleft=true}
			<br />
			<ul>
				<li>{$LANG.affiliatesignupinfo1}</li>
				<li>{$LANG.affiliatesignupinfo2}</li>
				<li>{$LANG.affiliatesignupinfo3}</li>
			</ul>
			<br />
			<form method="post" action="affiliates.php">
				<input type="hidden" name="activate" value="true" />
				<p align="center">
					<input id="activateAffiliate" type="submit" value="{$LANG.affiliatesactivate}" class="btn btn-success" />
				</p>
			</form>
		{else}
			{include file="$template/includes/alert.tpl" type="warning" msg=$LANG.affiliatesdisabled textleft=true}	
		{/if}
	</div>
</div>
