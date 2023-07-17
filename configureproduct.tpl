{include file="orderforms/{$carttpl}/common.tpl"}
<script>
var _localLang = {
    'addToCart': '{$LANG.orderForm.addToCart|escape}',
    'addedToCartRemove': '{$LANG.orderForm.addedToCartRemove|escape}'
}
</script>
	{if $productinfo.module eq 'soyoustart' || $productinfo.module eq 'soyoustart_vps'}	
		<link rel="stylesheet" href="templates/orderforms/{$carttpl}/css/style-design.css">
		<link rel="stylesheet" href="templates/orderforms/{$carttpl}/css/font-awesome.css" type="text/css">
    	<link rel="stylesheet" href="templates/orderforms/{$carttpl}/css/all.min.css">
    	<link rel="stylesheet" href="templates/orderforms/{$carttpl}/css/style-ovh.css" type="text/css">
    	<link rel="stylesheet" href="templates/orderforms/{$carttpl}/css/responsive.css" type="text/css">
    	<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    	<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
	{/if}
<div id="order-standard_cart">
    <div class="row">
        <div class="col-md-12">
            {include file="orderforms/{$carttpl}/sidebar-categories.tpl"}
        </div>
        <div class="configureProductDiv viewCartDiv shared-hosting col-md-12">            
            {include file="orderforms/{$carttpl}/sidebar-categories-collapsed.tpl"}

            <form id="frmConfigureProduct">
                <input type="hidden" name="configure" value="true" />
                <input type="hidden" name="i" value="{$i}" />

                <div class="row leftRow">
                    <div class="col-md-8">
                    <div class="left">
                        <h1 class="heding">{$LANG.orderconfigure}</h1>                        
                        <p>{$LANG.orderForm.configureDesiredOptions}</p>
                         <div class="personal_section">
                            <h2>{$productinfo.name}</h2>
							{if $productinfo.description}
								<ul>
								  {$productinfo.description}
								</ul>
							{/if}
                          </div>
							<div class="alert alert-danger hidden" role="alert" id="containerProductValidationErrors">
								<p>{$LANG.orderForm.correctErrors}:</p>
								<ul id="containerProductValidationErrorsList"></ul>
							</div>
                        {if $pricing.type eq "recurring"}
						{if $productinfo.module eq 'soyoustart' || $productinfo.module eq 'soyoustart_vps' }
<div class="billingcycle-sec">
    <div class="row">
            {if $pricing.monthly}
          		<div class="col-md-3">
  					<div class="billingcycle-box">
  						<div class="custom-radios">
					        <!--<input id="radio-1" class="radio-custom" name="radio-group" type="radio">-->
					        <input type="radio" class="radio-custom" name="billingcycle" id="cycle1" value="monthly"{if $billingcycle eq "monthly"} checked{/if}  onchange ="updatesoyoustartbilling();" onclick="{if $configurableoptions}updateConfigurableOptions({$i}, this.value){else}recalctotals(){/if}" />
                           <label for="cycle1" class="radio-custom-label"></label>
					    </div>
					    {if $productinfo.module eq 'soyoustart'}
					         <p><strong>{$currency.prefix}{$pricing.rawpricing.monthly} + {$currency.prefix}{$pricing.rawpricing.msetupfee}</strong><span>{$currency.suffix} Monthly</span></span></p>
					    {else}
					         <p><strong>{$currency.prefix}{$pricing.rawpricing.monthly}</strong><span>{$currency.suffix} Monthly</span></span></p>
					    {/if}
  					</div>
  				</div>
  			{/if}
  			            {if $pricing.quarterly}
          		<div class="col-md-3">
  					<div class="billingcycle-box">
  						<div class="custom-radios">
					        <!--<input id="radio-1" class="radio-custom" name="radio-group" type="radio">-->
					         <input type="radio" name="billingcycle" class="radio-custom" id="cycle2" value="quarterly"{if $billingcycle eq "quarterly"} checked{/if}  onchange ="updatesoyoustartbilling();" onclick="{if $configurableoptions}updateConfigurableOptions({$i}, this.value){else}recalctotals(){/if}" />
           			        <label for="cycle2" class="radio-custom-label"></label>
					    </div>
					    <p><strong>{$currency.prefix}{$pricing.rawpricing.quarterly}</strong><span>{$currency.suffix} Quartely</span></span></p>
  					</div>
  				</div>
  			{/if}
  			            {if $pricing.semiannually}
          		<div class="col-md-3">
  					<div class="billingcycle-box">
  						<div class="custom-radios">
					        <!--<input id="radio-1" class="radio-custom" name="radio-group" type="radio">-->
					           <input type="radio" name="billingcycle" class="radio-custom" id="cycle3" value="semiannually"{if $billingcycle eq "semiannually"} checked{/if}  onchange ="updatesoyoustartbilling();" onclick="{if $configurableoptions}updateConfigurableOptions({$i}, this.value){else}recalctotals(){/if}" />
           
					        <label for="cycle3" class="radio-custom-label"></label>
					    </div>
					    <p><strong>{$currency.prefix}{$pricing.rawpricing.semiannually}</strong><span>{$currency.suffix} SemiAnually</span></span></p>
  					</div>
  				</div>
  			{/if}
  			            {if $pricing.annually}
          		<div class="col-md-3">
  					<div class="billingcycle-box">
  						<div class="custom-radios">
					        <!--<input id="radio-1" class="radio-custom" name="radio-group" type="radio">-->
					           <input type="radio" name="billingcycle" class="radio-custom" id="cycle4" value="annually"{if $billingcycle eq "annually"} checked{/if} onchange ="updatesoyoustartbilling();"  onclick="{if $configurableoptions}updateConfigurableOptions({$i}, this.value){else}recalctotals(){/if}" />
          
					        <label for="cycle4" class="radio-custom-label"></label>
					    </div>
					    <p><strong>{$currency.prefix}{$pricing.rawpricing.annually}</strong><span>{$currency.suffix} Annually</span></span></p>
  					</div>
  				</div>
  			{/if}
  			{if $pricing.biennially}
          		<div class="col-md-3">
  					<div class="billingcycle-box">
  						<div class="custom-radios">
					        <!--<input id="radio-1" class="radio-custom" name="radio-group" type="radio">-->
					       <input type="radio" name="billingcycle" id="cycle5" class="radio-custom" value="biennially"{if $billingcycle eq "biennially"} checked{/if}  onchange ="updatesoyoustartbilling();" onclick="{if $configurableoptions}updateConfigurableOptions({$i}, this.value){else}recalctotals(){/if}" />
                          <label for="cycle5" class="radio-custom-label"></label>
					    </div>
					    <p><strong>{$currency.prefix}{$pricing.rawpricing.biennially}</strong><span>{$currency.suffix} Biennially</span></span></p>
  					</div>
  				</div>
  			{/if}
  		    {if $pricing.triennially}
          		<div class="col-md-3">
  					<div class="billingcycle-box">
  						<div class="custom-radios">
					        <!--<input id="radio-1" class="radio-custom" name="radio-group" type="radio">-->
					       <input type="radio" name="billingcycle" id="cycle6" class="radio-custom" value="triennially"{if $billingcycle eq "triennially"} checked{/if} onchange ="updatesoyoustartbilling();"  onclick="{if $configurableoptions}updateConfigurableOptions({$i}, this.value){else}recalctotals(){/if}" />
     				        <label for="cycle6" class="radio-custom-label"></label>
					    </div>
					    <p><strong>{$currency.prefix}{$pricing.rawpricing.triennially}</strong><span>{$currency.suffix} Triennialy</span></span></p>
  					</div>
  				</div>
  			{/if}
    </div>
</div>
{else}
                            <div class="field-container">
                                <div class="form-group billingcycleDiv">
                                    <label for="inputBillingcycle">{$LANG.cartchoosecycle}</label>
                                    <select name="billingcycle" id="inputBillingcycle" class="form-control select-inline" onchange="{if $configurableoptions}updateConfigurableOptions({$i}, this.value);{else}recalctotals();{/if}">
                                        {if $pricing.monthly}
                                            <option value="monthly"{if $billingcycle eq "monthly"} selected{/if}>
                                                {$pricing.monthly}
                                            </option>
                                        {/if}
                                        {if $pricing.quarterly}
                                            <option value="quarterly"{if $billingcycle eq "quarterly"} selected{/if}>
                                                {$pricing.quarterly}
                                            </option>
                                        {/if}
                                        {if $pricing.semiannually}
                                            <option value="semiannually"{if $billingcycle eq "semiannually"} selected{/if}>
                                                {$pricing.semiannually}
                                            </option>
                                        {/if}
                                        {if $pricing.annually}
                                            <option value="annually"{if $billingcycle eq "annually"} selected{/if}>
                                                {$pricing.annually}
                                            </option>
                                        {/if}
                                        {if $pricing.biennially}
                                            <option value="biennially"{if $billingcycle eq "biennially"} selected{/if}>
                                                {$pricing.biennially}
                                            </option>
                                        {/if}
                                        {if $pricing.triennially}
                                            <option value="triennially"{if $billingcycle eq "triennially"} selected{/if}>
                                                {$pricing.triennially}
                                            </option>
                                        {/if}
                                    </select>
                                </div>
                            </div>
							{/if}
                        {/if}
                        {if count($metrics) > 0}
                            <div class="sub-heading">
                                <span>{$LANG.metrics.title}</span>
                            </div>

                            <p>{$LANG.metrics.explanation}</p>

                            <ul class="wgs-metrices">
                                {foreach $metrics as $metric}
                                    <li>
                                        {$metric.displayName}
                                        -
                                        {if count($metric.pricing) > 1}
                                            {$LANG.metrics.startingFrom} {$metric.lowestPrice} / {if $metric.unitName}{$metric.unitName}{else}{$LANG.metrics.unit}{/if}
                                            <button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#modalMetricPricing-{$metric.systemName}">
                                                {$LANG.metrics.viewPricing}
                                            </button>
                                        {elseif count($metric.pricing) == 1}
                                            {$metric.lowestPrice} / {if $metric.unitName}{$metric.unitName}{else}{$LANG.metrics.unit}{/if}
                                            {if $metric.includedQuantity > 0} ({$metric.includedQuantity} {$LANG.metrics.includedNotCounted}){/if}
                                        {/if}
                                        {include file="$template/usagebillingpricing.tpl"}
                                    </li>
                                {/foreach}
                            </ul>
                            <br>
                        {/if}
                        {if $productinfo.type eq "server"}
                            <div class="sub-heading">
                                <span>{$LANG.cartconfigserver}</span>
                            </div>
                            <div class="field-container configurationContainer wgs-configuration-option">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="inputHostname">{$LANG.serverhostname}</label>
                                            <input type="text" name="hostname" class="form-control" id="inputHostname" value="{$server.hostname}" placeholder="servername.yourdomain.com">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="inputRootpw">{$LANG.serverrootpw}</label>
                                            <input type="password" name="rootpw" class="form-control" id="inputRootpw" value="{$server.rootpw}">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="inputNs1prefix">{$LANG.serverns1prefix}</label>
                                            <input type="text" name="ns1prefix" class="form-control" id="inputNs1prefix" value="{$server.ns1prefix}" placeholder="ns1">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="inputNs2prefix">{$LANG.serverns2prefix}</label>
                                            <input type="text" name="ns2prefix" class="form-control" id="inputNs2prefix" value="{$server.ns2prefix}" placeholder="ns2">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {/if}

                        {if $configurableoptions}
							<h3>{$LANG.orderconfigpackage}</h3>
                            <div class="product-configurable-options wgs-configurable-option {if $productinfo.module eq 'soyoustart' || $productinfo.module eq 'soyoustart_vps'} soyoustartHtml bil-title{/if}" id="productConfigurableOptions">
                                <div class="row">
								{if $productinfo.module eq 'soyoustart' || $productinfo.module eq 'soyoustart_vps' }
{foreach from=$configurableoptions item=configoption}	
	{if $configoption.optiontype eq 1}
		{if $configoption.optionname eq "cPanel"}
		<div class="col-sm-12 col-md-12 col-lg-12">
			<div class="bil-title">
				<h4><img src="templates/orderforms/{$carttpl}/images/crt-icon3.png" alt="crt-icon3"> Choose a Paid Licenses</h4>
				<p>Once you have selected your license, you will find it pre-installed, along with other free Linux licenses, in the Control Panel.</p>
			</div>
		</div>
			<div class="col-md-3">
				<div class="billingcycle-box operating-box">
				    <div class="lg-icons"><img src="templates/orderforms/{$carttpl}/images/lic-icon1.png" align="lic-icon1"></div>
				    <h4>{$configoption.optionname}</h4>
								<select name="configoption[{$configoption.id}]" onchange="recalctotals()" class="op-select">
									{foreach key=num2 item=options from=$configoption.options}
										<option value="{$options.id}"{if $configoption.selectedvalue eq $options.id} selected="selected"{/if}>{$options.name}</option>
									{/foreach}
								</select>
				</div>
			</div>
		{else}
					<div class="col-md-3">
						<div class="billingcycle-box operating-box">	
							{if $configoption.optionname == 'SqlServer'}
							 <div class="lg-icons"><img src="templates/orderforms/{$carttpl}/images/lic-icon3.png" align="lic-icon1"></div>
							{elseif $configoption.optionname == 'DirectAdmin'}
							 <div class="lg-icons"><img src="templates/orderforms/{$carttpl}/images/lic-icon4.png" align="lic-icon1"></div>
							{elseif $configoption.optionname == 'CloudLinux'}
							 <div class="lg-icons"><img src="templates/orderforms/{$carttpl}/images/lic-icon6.png" align="lic-icon1"></div>
							{elseif $configoption.optionname == 'Plesk'}
							 <div class="lg-icons"><img src="templates/orderforms/{$carttpl}/images/lic-icon5.png" align="lic-icon1"></div>
							 {else if $configoption.optionname eq "cPanel"}
							 <div class="lg-icons"><img src="templates/orderforms/{$carttpl}/images/lic-icon1.png" align="lic-icon1"></div>
							 {else if $configoption.optionname == 'Windows'}
							    <div class="lg-icons"><img src="templates/orderforms/{$carttpl}/images/lic-icon2.png" align="lic-icon1"></div>
						    {/if}
				             <h4>{$configoption.optionname}</h4>
								<select name="configoption[{$configoption.id}]" onchange="recalctotals()" class="op-select">
									{foreach key=num2 item=options from=$configoption.options}
										<option value="{$options.id}"{if $configoption.selectedvalue eq $options.id} selected="selected"{/if}>{$options.name}</option>
									{/foreach}
								</select>
								</div>
						<!-- <div class="logo-part-2">
							<label class="dropdown">
									<select name="configoption[{$configoption.id}]" onchange="recalctotals()" class="op-select">
									{foreach key=num2 item=options from=$configoption.options}
										<option value="{$options.id}"{if $configoption.selectedvalue eq $options.id} selected="selected"{/if}>{$options.name}</option>
									{/foreach}
								</select>
							</label>					
						</div>-->
					</div>
		{/if}	
<!--	</div></div>-->
	{elseif $configoption.optiontype eq 2}
		{if $configoption.optionname eq "Server Location"}
			<div class="col-sm-12 col-md-12 col-lg-12">
				<h4><img src="templates/orderforms/{$carttpl}/images/crt-icon1.png" alt="crt-icon1"> Datacenter Location</h4>
				<p>where do you want them to be installed?</p>
			</div>
			<div class="billingcycle-sec configurable-sec">
  				<div class="row">
    			{foreach key=num2 item=options from=$configoption.options}
        			<div class="col-md-3">
        				<div class="billingcycle-box config-box">
        					<div class="custom-radios">
        							<input type="radio" id="configoption{$options.id}" name="configoption[{$configoption.id}]" value="{$options.id}"{if $configoption.selectedvalue eq $options.id} checked="checked"{/if} onclick="recalctotals()" class="radio-custom" />
        							<label for="configoption{$options.id}" class="radio-custom-label"></label>
        					</div>
        					<div class="lg-icons">
        					    {if $options.name|strstr:'France'}
                                 	<img src="templates/orderforms/{$carttpl}/images/lg-icon1.png" align="lg-icon1">
                                {elseif $options.name|strstr:'Poland'}
                                   <img src="templates/orderforms/{$carttpl}/images/lg-icon4.png" align="lg-icon1">
                                {elseif $options.name|strstr:'Canada'}
                                   <img src="templates/orderforms/{$carttpl}/images/lg-icon5.png" align="lg-icon1">
                                {elseif $options.name|strstr:'United Kingdom'}
                                   <img src="templates/orderforms/{$carttpl}/images/lg-icon2.png" align="lg-icon1">
                                {elseif $options.name|strstr:'Germany'}
                                  <img src="templates/orderforms/{$carttpl}/images/lg-icon3.png" align="lg-icon1">
                                {elseif $options.name|strstr:'Singapour'}
                                   <img src="templates/orderforms/{$carttpl}/images/singapore.jpg" align="lg-icon1">
                                {elseif $options.name|strstr:'Sydney'}
                                   <img src="templates/orderforms/{$carttpl}/images/sydney.jpg" align="lg-icon1">
                                {elseif $options.name|strstr:'Europe'}
                                   <img src="templates/orderforms/{$carttpl}/images/europe.jpg" align="lg-icon1">
                                {elseif $options.name|strstr:'United States'}
                                   <img src="templates/orderforms/{$carttpl}/images/us.jpg" align="lg-icon1">
                                {elseif $options.name|strstr:'Australia'}
                                   <img src="templates/orderforms/{$carttpl}/images/australia.jpg" align="lg-icon1">
                                {/if}
        			
        				    </div>
					         <p>{$options.name}</p>
					        </div>
        			</div>
    			{/foreach}
		  	</div>
  		</div>
		{elseif $configoption.optionname eq "Opreating System"}
			<div class="col-sm-12 col-md-12 col-lg-12">
			  	<div class="bil-title">
  				    <h4><img src="templates/orderforms/{$carttpl}/images/crt-icon2.png" alt="crt-icon2"> images</h4>
  				    <p>Choose the operating system to install on your server.</p>
  			    </div>		
			</div>
			<div class="opreatingHTML">	
				<div class="col-sm-12 col-md-12 col-lg-12">
					<img src="modules/addons/soyoustart/images/30.gif" style="margin-left: 33%;" id="showOVHloader">
				</div>
		</div>
	{elseif $configoption.optionname eq "Disk"}
			<div class="col-sm-12 col-md-12 col-lg-12">
			    <div class="bil-title diskHeading">
  				    <h4><img src="templates/orderforms/{$carttpl}/images/crt-icon5.png" alt="crt-icon5"> Storage disks</h4>
  			        <p>Once your basic configuration has been chosen, you can customise your server by selecting the types of disks you want. For example, if you want to increase your IOPS significantly, you can choose an NVMe disk, or you can opt for RAID for more redundancy.</p>
  			    </div>
  			 </div>
			<div class="col-sm-12 col-md-12 col-lg-12">
				<div class="list-section">
					<div class="Diskconfig">
						<p>Disk configuration</p> 
						<p class="">{$billingcycle|ucfirst} Price</p>
					</div>
					<div class="list-radio-btn">
						{foreach key=num2 item=options from=$configoption.options}
							<p>
								<input type="radio" id="configoption{$options.id}" value="{$options.id}" name="configoption[{$configoption.id}]" {if $configoption.selectedvalue eq $options.id} checked="checked"{/if} onclick="recalctotals()">
								<label for="configoption{$options.id}">{$options.nameonly}<span class="">{$currency.prefix}{$options.fullprice}</span></label>
							</p>
						{/foreach}
					</div>
				</div>
			</div>
	{elseif $configoption.optionname eq "Memory"}
			<div class="col-sm-12 col-md-12 col-lg-12">
			    <div class="bil-title memoryHeading">
  				    <h4><img src="templates/orderforms/{$carttpl}/images/crt-icon6.png" alt="crt-icon2">Memory</h4>
  				    <p>Once you have chosen your basic configuration, you can customise your server by selecting the volume of RAM you need.</p>
  			    </div>		
			</div>
			<div class="col-sm-12 col-md-12 col-lg-12">
				<div class="list-section memoryList">
					<div class="Diskconfig">
						<p>Memory</p>
						<p class="">{$billingcycle|ucfirst} Price</p>
					</div>
					<div class="list-radio-btn">
						{foreach key=num2 item=options from=$configoption.options}
							<p>
								<input type="radio" id="configoption{$options.id}" value="{$options.id}" name="configoption[{$configoption.id}]" {if $configoption.selectedvalue eq $options.id} checked="checked"{/if} onclick="recalctotals()">
								<label for="configoption{$options.id}">{$options.nameonly}<span class="">{$currency.prefix}{$options.fullprice}</span></label>
							</p>
						{/foreach}
					</div>
				</div>
			</div>
		{elseif $configoption.optionname eq "Additional IPs"}
			<div class="col-sm-12 col-md-12 col-lg-12">
			 <div class="bil-title ipHeading">
  				<h4><img src="templates/orderforms/{$carttpl}/images/crt-icon4.png" alt="crt-icon4"> Additional IP's</h4>
  				<p>Choose the operating system to install on your server.</p>
  			   </div>
			</div>
			<div class="col-sm-12 col-md-12 col-lg-12">
				<div class="billingcycle-sec">
					<div class="row">
						{foreach key=num2 item=options from=$configoption.options}
				    	<div class="col-md-3">
				    	    <div class="billingcycle-box">
				    	        <div class="custom-radios">
								<input type="radio" id="configoption{$options.id}" class="radio-custom" value="{$options.id}" name="configoption[{$configoption.id}]" {if $configoption.selectedvalue eq $options.id} checked="checked"{/if} onclick="recalctotals()">
								<label for="configoption{$options.id}" class="radio-custom-label">
							</div>
							<p><strong>{$options.nameonly}</strong>{$currency.prefix}{$options.fullprice}</p>
					    </div></div>
						{/foreach}
					</div>
				</div>
			</div>
	{elseif $configoption.optionname eq "Public network"}
			<div class="col-sm-12 col-md-12 col-lg-12">
				<div class="bil-title networkHeading">
  				    <h4><img src="templates/orderforms/{$carttpl}/images/crt-icon7.png" alt="crt-icon4">Network interface</h4>
  			   </div>
			</div>
			<div class="col-sm-12 col-md-12 col-lg-12">
				<div class="list-section">
					<div class="Diskconfig">
						<p>Public Network</p>
						<p class="">{$billingcycle|ucfirst} Price</p>
					</div>
					<div class="list-radio-btn">
						{foreach key=num2 item=options from=$configoption.options}
							<p>
								<input type="radio" id="configoption{$options.id}" value="{$options.id}" name="configoption[{$configoption.id}]" {if $configoption.selectedvalue eq $options.id} checked="checked"{/if} onclick="recalctotals()">
								<label for="configoption{$options.id}">{$options.nameonly}<span class="">{$currency.prefix}{$options.fullprice}</span></label>
							</p>
						{/foreach}
					</div>
				</div>
			</div>
	{elseif $configoption.optionname eq "Private network"}
			<div class="col-sm-12 col-md-12 col-lg-12">
				<h3 class="soyoustartHeading"><i class="fa fa-check" aria-hidden="true"></i>Choose a Private Network</h3>
			</div>
			<div class="col-sm-12 col-md-12 col-lg-12">
				<div class="list-section">
					<div class="Diskconfig">
						<p>Private Network</p>
						<p class="">{$billingcycle|ucfirst} Price</p>
					</div>
					<div class="list-radio-btn">
						{foreach key=num2 item=options from=$configoption.options}
							<p>
								<input type="radio" id="configoption{$options.id}" value="{$options.id}" name="configoption[{$configoption.id}]" {if $configoption.selectedvalue eq $options.id} checked="checked"{/if} onclick="recalctotals()">
								<label for="configoption{$options.id}">{$options.nameonly}<span class="">{$currency.prefix}{$options.fullprice}</span></label>
							</p>
						{/foreach}
					</div>
				</div>
			</div>
		{elseif $configoption.optionname eq "Additional Disk"}
			<div class="col-sm-12 col-md-12 col-lg-12">
			    <div class="bil-title">
  				    <h4><img src="templates/orderforms/{$carttpl}/images/additional-disk.png" alt="crt-icon4">Additional Disk</h4>
  				    <p>Increase the storage space available on your VPS by adding an additional partition.</p>
  			   </div>
			</div>
			<div class="col-sm-12 col-md-12 col-lg-12">
				<div class="list-section">
					<div class="Diskconfig">
						<p>Disk</p>
						<p class="">{$billingcycle|ucfirst} Price</p>
					</div>
					<div class="list-radio-btn">
						{foreach key=num2 item=options from=$configoption.options}
							<p>
								<input type="radio" id="configoption{$options.id}" value="{$options.id}" name="configoption[{$configoption.id}]" {if $configoption.selectedvalue eq $options.id} checked="checked"{/if} onclick="recalctotals()">
								<label for="configoption{$options.id}">{$options.nameonly}<span class="">{$currency.prefix}{$options.fullprice}</span></label>
							</p>
						{/foreach}
					</div>
				</div>
			</div>
		{elseif $configoption.optionname eq "Control Panel Software"}
			<div class="col-sm-12 col-md-12 col-lg-12">
			    <div class="bil-title">
  				    <h4><img src="templates/orderforms/{$carttpl}/images/control_panel_software.png" alt="crt-icon4">Control Panel software</h4>
  			   </div>
			</div>
			<div class="col-sm-12 col-md-12 col-lg-12">
				<div class="list-section">
					<div class="Diskconfig">
						<p>Software</p>
						<p class="">{$billingcycle|ucfirst} Price</p>
					</div>
					<div class="list-radio-btn">
						{foreach key=num2 item=options from=$configoption.options}
							<p>
								<input type="radio" id="configoption{$options.id}" value="{$options.id}" name="configoption[{$configoption.id}]" {if $configoption.selectedvalue eq $options.id} checked="checked"{/if} onclick="recalctotals()">
								<label for="configoption{$options.id}">{$options.nameonly}<span class="">{$currency.prefix}{$options.fullprice}</span></label>
							</p>
						{/foreach}
					</div>
				</div>
			</div>
		{/if}
	{elseif $configoption.optiontype eq 3}
		{if $configoption.optionname eq "Snapshot"}
			<div class="col-sm-12 col-md-12 col-lg-12">
			    <div class="bil-title">
  				    <h4><img src="templates/orderforms/{$carttpl}/images/Snapshot.png" alt="crt-icon4">Snapshot</h4>
  				    <p>Capture an image of your server at a given time. This option is easy to use, and perfect for quickly restoring your VPS or securing it before you make changes.</p>
  			   </div>
			</div>
			<div class="col-sm-4 col-md-4 col-lg-4">
				<div class="C-panel">
					<div class="logo_section">
						<div class="d-flex logo-part pb-2">
							<input type="checkbox" id="{$options.id}" name="configoption[{$configoption.id}]" value="1"{if $configoption.selectedqty} checked="checked"{/if} onclick="recalctotals()" class="form-control soyoustartRadio" />
							<label for="{$options.id}" class="radioname">{$configoption.options.0.name}</label>
						</div>			
					</div>
				</div>
			</div>
	{elseif $configoption.optionname eq "Automated Backup"}
			<div class="col-sm-12 col-md-12 col-lg-12">
			    <div class="bil-title">
  				    <h4><img src="templates/orderforms/{$carttpl}/images/automated-backup.png" alt="crt-icon4">Automated Backup</h4>
  				    <p>Store and recover your files on a dedicated 200 GB space. Whichever operating system you choose for your VPS, you can access it using FTP, NFS and CIFS protocols.</p>
  			   </div>
			</div>
			<div class="col-sm-4 col-md-4 col-lg-4">
				<div class="C-panel">
					<div class="logo_section">
						<div class="d-flex logo-part pb-2">
							<input type="checkbox" id="{$options.id}" name="configoption[{$configoption.id}]" value="1"{if $configoption.selectedqty} checked="checked"{/if} onclick="recalctotals()" class="form-control soyoustartRadio" />
							<label for="{$options.id}" class="radioname">{$configoption.options.0.name}</label>
						</div>			
					</div>
				</div>
			</div>
	{elseif $configoption.optionname eq "FTP Backup"}
			<div class="col-sm-12 col-md-12 col-lg-12">
			    <div class="bil-title">
  				    <h4><img src="templates/orderforms/{$carttpl}/images/backup_space.png" alt="crt-icon4">Backup space</h4>
  				    <p>Schedule daily backups for your VPS across a 14-day period. This option is essential to avoid any risk of data loss.</p>
  			   </div>
			</div>
			<div class="col-sm-4 col-md-4 col-lg-4">
				<div class="C-panel">
					<div class="logo_section">
						<div class="d-flex logo-part pb-2">
							<input type="checkbox" id="{$options.id}" name="configoption[{$configoption.id}]" value="1"{if $configoption.selectedqty} checked="checked"{/if} onclick="recalctotals()" class="form-control soyoustartRadio" />
							<label for="{$options.id}" class="radioname">{$configoption.options.0.name}</label>
						</div>			
					</div>
				</div>
			</div>
		{/if}
	{/if}
	
	
{/foreach}
{else}
                                    {foreach $configurableoptions as $num => $configoption}
                                        {if $configoption.optiontype eq 1}
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="inputConfigOption{$configoption.id}">{$configoption.optionname}</label>
                                                    <select name="configoption[{$configoption.id}]" id="inputConfigOption{$configoption.id}" class="form-control">
                                                        {foreach key=num2 item=options from=$configoption.options}
                                                            <option value="{$options.id}"{if $configoption.selectedvalue eq $options.id} selected="selected"{/if}>
                                                                {$options.name}
                                                            </option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                            </div>
                                        {elseif $configoption.optiontype eq 2}
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="inputConfigOption{$configoption.id}">{$configoption.optionname}</label>
                                                    {foreach key=num2 item=options from=$configoption.options}
                                                        <br />
                                                        <label>
                                                            <input type="radio" name="configoption[{$configoption.id}]" value="{$options.id}"{if $configoption.selectedvalue eq $options.id} checked="checked"{/if} />
                                                            {if $options.name}
                                                                {$options.name}
                                                            {else}
                                                                {$LANG.enable}
                                                            {/if}
                                                        </label>
                                                    {/foreach}
                                                </div>
                                            </div>
                                        {elseif $configoption.optiontype eq 3}
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label for="inputConfigOption{$configoption.id}">{$configoption.optionname}</label>
                                                    <br />
                                                    <label>
                                                        <input type="checkbox" name="configoption[{$configoption.id}]" id="inputConfigOption{$configoption.id}" value="1"{if $configoption.selectedqty} checked{/if} />
                                                        {if $configoption.options.0.name}
                                                            {$configoption.options.0.name}
                                                        {else}
                                                            {$LANG.enable}
                                                        {/if}
                                                    </label>
                                                </div>
                                            </div>
                                        {elseif $configoption.optiontype eq 4}
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <label for="inputConfigOption{$configoption.id}">{$configoption.optionname}</label>
                                                    {if $configoption.qtymaximum}
                                                        {if !$rangesliderincluded}
                                                            <script type="text/javascript" src="{$BASE_PATH_JS}/ion.rangeSlider.min.js"></script>
                                                            <link href="{$BASE_PATH_CSS}/ion.rangeSlider.css" rel="stylesheet">
                                                            <link href="{$BASE_PATH_CSS}/ion.rangeSlider.skinModern.css" rel="stylesheet">
                                                            {assign var='rangesliderincluded' value=true}
                                                        {/if}
                                                        <input type="text" name="configoption[{$configoption.id}]" value="{if $configoption.selectedqty}{$configoption.selectedqty}{else}{$configoption.qtyminimum}{/if}" id="inputConfigOption{$configoption.id}" class="form-control" />
                                                        <script>
                                                            var sliderTimeoutId = null;
                                                            var sliderRangeDifference = {$configoption.qtymaximum} - {$configoption.qtyminimum};
                                                            // The largest size that looks nice on most screens.
                                                            var sliderStepThreshold = 25;
                                                            // Check if there are too many to display individually.
                                                            var setLargerMarkers = sliderRangeDifference > sliderStepThreshold;

                                                            jQuery("#inputConfigOption{$configoption.id}").ionRangeSlider({
                                                                min: {$configoption.qtyminimum},
                                                                max: {$configoption.qtymaximum},
                                                                grid: true,
                                                                grid_snap: setLargerMarkers ? false : true,
                                                                onChange: function() {
                                                                    if (sliderTimeoutId) {
                                                                        clearTimeout(sliderTimeoutId);
                                                                    }

                                                                    sliderTimeoutId = setTimeout(function() {
                                                                        sliderTimeoutId = null;
                                                                        recalctotals();
                                                                    }, 250);
                                                                }
                                                            });
                                                        </script>
                                                    {else}
                                                        <div>
                                                            <input type="number" name="configoption[{$configoption.id}]" value="{if $configoption.selectedqty}{$configoption.selectedqty}{else}{$configoption.qtyminimum}{/if}" id="inputConfigOption{$configoption.id}" min="{$configoption.qtyminimum}" onchange="recalctotals()" onkeyup="recalctotals()" class="form-control form-control-qty" />
                                                            <span class="form-control-static form-control-static-inline">
                                                                x {$configoption.options.0.name}
                                                            </span>
                                                        </div>
                                                    {/if}
                                                </div>
                                            </div>
                                        {/if}
                                        {if $num % 2 != 0}
                                            </div>
                                            <div class="row">
                                        {/if}
                                    {/foreach}
									{/if}
                                </div>
                            </div>

                        {/if}

                        {if $customfields}

                            <div class="sub-heading pb-1">
                                <span>{$LANG.orderadditionalrequiredinfo}<br><i><small>{lang key='orderForm.requiredField'}</small></i></span>
                            </div>

                            <div class="field-container configurationContainer wgs-custom-field">
                                {foreach $customfields as $customfield}
                                    <div class="form-group">
                                        <label for="customfield{$customfield.id}">{$customfield.name} {$customfield.required}</label>
                                        {$customfield.input}
                                        {if $customfield.description}
                                            <span class="field-help-text">
                                                {$customfield.description}
                                            </span>
                                        {/if}
                                    </div>
                                {/foreach}
                            </div>

                        {/if}

                        {if $addons || count($addonsPromoOutput) > 0}

                            <div class="sub-heading">
                                <span>{$LANG.cartavailableaddons}</span>
                            </div>

                            {foreach $addonsPromoOutput as $output}
                                <div>
                                    {$output}
                                </div>
                            {/foreach}

                            <div class="row addon-products">
                                {foreach $addons as $addon}
                                    <div class="col-sm-{if count($addons) > 1}6{else}12{/if}">
                                        <div class="panel panel-default panel-addon{if $addon.status} panel-addon-selected{/if}">
                                            <div class="panel-body">
                                                <label>
                                                    <input type="checkbox" name="addons[{$addon.id}]"{if $addon.status} checked{/if} />
                                                    {$addon.name}
                                                </label><br />
                                                {$addon.description}
                                            </div>
                                            <div class="panel-price">
                                                {$addon.pricing}
                                            </div>
                                            <div class="panel-add">
                                                <i class="fas fa-plus"></i>
                                                {$LANG.addtocart}
                                            </div>
                                        </div>
                                    </div>
                                {/foreach}
                            </div>

                        {/if}

                        <div class="alert alert-warning info-text-sm">
                            <i class="fas fa-question-circle"></i>
                            {$LANG.orderForm.haveQuestionsContact} <a href="contact.php" target="_blank" class="alert-link">{$LANG.orderForm.haveQuestionsClickHere}</a>
                        </div>
                    </div>
                    </div>
                    <div class="col-md-4" id="scrollingPanelContainer">
                        <h2 class="pconfig">{$LANG.ordersummary}</h2>
                        <div id="orderSummary">                            
                            <div class="orderSummaryCd">
                                <div class="order-summary">
                                    <div class="loader" id="orderSummaryLoader">
                                        <i class="fas fa-fw fa-sync fa-spin"></i>
                                    </div>                                    
                                    <div class="summary-container" id="producttotal"></div>
                                </div>
                                <div class="text-center">
                                    <button type="submit" id="btnCompleteProductConfig" class="btn btn-primary btn-lg">
                                        {$LANG.continue}
                                    </button>
                                </div>
                            </div>    
                        </div>

                    </div>

                </div>

            </form>
        </div>
    </div>
</div>

<script>recalctotals();</script>
