{if $invalidTicketId}
    {include file="$template/includes/alert.tpl" type="danger" title=$LANG.thereisaproblem msg=$LANG.supportticketinvalid textcenter=true}
{else}
    {if $closedticket}
        {include file="$template/includes/alert.tpl" type="warning" msg=$LANG.supportticketclosedmsg textcenter=true}
    {/if}
    {if $errormessage}
        {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
    {/if}
{/if}
{if !$invalidTicketId}
<div class="view_ticket_col">
<div class="shared-hosting">
    <div class="panel panel-info panel-collapsable{if !$postingReply} panel-collapsed{/if} hidden-print">
        <div class="panel-heading" id="ticketReply">
            <div class="collapse-icon pull-right">
                <i class="fas fa-{if !$postingreply}plus{else}minus{/if}"></i>
            </div>
            <h3 class="panel-title">
                <i class="fa fa-pencil-square-o"></i> &nbsp; {$LANG.supportticketsreply}
            </h3>
        </div>
        <div class="panel-body{if !$postingReply} panel-body-collapsed{/if}">
            <form method="post" action="{$smarty.server.PHP_SELF}?tid={$tid}&amp;c={$c}&amp;postreply=true" enctype="multipart/form-data" role="form" id="frmReply">
                <div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<label for="inputName">{$LANG.supportticketsclientname}</label>
							<input class="form-control" type="text" name="replyname" id="inputName" value="{$replyname}"{if $loggedin} disabled="disabled"{/if}>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label for="inputEmail">{$LANG.supportticketsclientemail}</label>
							<input class="form-control" type="text" name="replyemail" id="inputEmail" value="{$replyemail}"{if $loggedin} disabled="disabled"{/if}>
						</div>
					</div>
					<div class="col-sm-12">
						<div class="form-group">
							<label for="inputMessage">{$LANG.contactmessage}</label>
							<textarea name="replymessage" id="inputMessage" rows="12" class="form-control markdown-editor" data-auto-save-name="ctr{$tid}">{$replymessage}</textarea>
						</div>
					</div>
					<div class="col-sm-9">
						<div class="form-group wgs-margin-bottom">
							<label for="inputAttachments">{$LANG.supportticketsticketattachments}</label>
							

							<!------use div----->
	                        <div class="file-upload-box" id="fileUploadBox"> 
	                          <div class="up-file-text-img">
	                          	<label>{$LANG.supportticketsallowedextensions}: {$allowedfiletypes} ({lang key="maxFileSize" fileSize="$uploadMaxFileSize"})</label>
	                          </div>
	                          <div class="up-file-field">
	                           <div class="waves-effect waves-light">
	                           <span>Choose file</span>
	                           		<input type="file" name="attachments[]" id="inputAttachments" onchange="extraAttachmentData(this);" class="form-control" />
	                           </div>
	                           </div>
	                         </div>
	                         <!------use div----->

							<div id="fileUploadsContainer"></div>							
						</div>
					</div>
					<div class="col-sm-3">
						<div class="up-r-btn">
							<label> &nbsp; </label>
							<button type="button" class="btn btn-default btn-block" onclick="extraTicketAttachment()">
								<i class="fas fa-plus"></i> {$LANG.addmore}
							</button>							
						</div>
					</div>					
					<div class="col-sm-12">
						<div class="form-group text-left">
						<input class="btn btn-primary wgs-submit-button" type="submit" name="save" value="{$LANG.supportticketsticketsubmit}" />
						<input class="btn btn-default wgs-cancel-button" type="reset" value="{$LANG.cancel}" onclick="jQuery('#ticketReply').click()" />
						</div>
					</div>
                </div>
            </form>
        </div>
    </div>
    <div class="panel panel-info visible-print-block">
        <div class="panel-heading">
            <h3 class="panel-title">
                {$LANG.ticketinfo}
            </h3>
        </div>
        <div class="panel-body container-fluid">
            <div class="row">
                <div class="col-md-2 col-xs-6">
                    <b>{$LANG.supportticketsticketid}</b><br />{$tid}
                </div>
                <div class="col-md-4 col-xs-6">
                    <b>{$LANG.supportticketsticketsubject}</b><br />{$subject}
                </div>
                <div class="col-md-2 col-xs-6">
                    <b>{$LANG.supportticketspriority}</b><br />{$urgency}
                </div>
                <div class="col-md-4 col-xs-6">
                    <b>{$LANG.supportticketsdepartment}</b><br />{$department}
                </div>
            </div>
        </div>
    </div>

    {foreach $descreplies as $reply}
		<div class="ticket-reply markdown-content{if $reply.admin} staff{/if}">
			<div class="view_ticket_box">
				<div class="top">
				   <img src="templates/{$template}/images/user-icon.png">  {$reply.requestor.name} 
				   <small>(
						{if $reply.requestor.type_normalised eq 'operator'}
                            {lang key='support.requestor.operator'}
                        {elseif $reply.requestor.type_normalised eq 'owner'}
                            {lang key='support.requestor.owner'}
                        {elseif $reply.requestor.type_normalised eq 'authorizeduser'}
                            {lang key='support.requestor.authorizeduser'}
                        {elseif $reply.requestor.type_normalised eq 'registereduser'}
                            {lang key='support.requestor.registereduser'}
                        {elseif $reply.requestor.type_normalised eq 'subaccount'}
                            {lang key='support.requestor.subaccount'}
                        {elseif $reply.requestor.type_normalised eq 'guest'}
                            {lang key='support.requestor.guest'}
                        {/if}
						)
					</small>
					<br/>
					<small>
						{if $reply.admin}
							{$LANG.supportticketsstaff}
						{else}
							{$reply.requestor.email}
						{/if}
					</small>
					<span><i class="fa fa-calendar-o"></i> {$reply.date}</span>  
				</div>
				<div class="message">
					{$reply.message}
					{if $reply.ipaddress}
						<hr>
						{lang key='support.ipAddress'}: {$reply.ipaddress}
					{/if}
					{if $reply.id && $reply.admin && $ratingenabled}
						<div class="clearfix">
							{if $reply.rating}
								<div class="rating-done">
									{for $rating=1 to 5}
										<span class="star{if (5 - $reply.rating) < $rating} active{/if}"></span>
									{/for}
									<div class="rated">{$LANG.ticketreatinggiven}</div>
								</div>
							{else}
								<div class="rating" ticketid="{$tid}" ticketkey="{$c}" ticketreplyid="{$reply.id}">
									<span class="star" rate="5"></span>
									<span class="star" rate="4"></span>
									<span class="star" rate="3"></span>
									<span class="star" rate="2"></span>
									<span class="star" rate="1"></span>
								</div>
							{/if}
						</div>
					{/if}
				</div>
				{if $reply.attachments}
					<div class="attachments">
						<strong>{$LANG.supportticketsticketattachments} ({$reply.attachments|count})</strong>
						{if $reply.attachments_removed}({lang key='support.attachmentsRemoved'}){/if}
						<ul>
							{foreach $reply.attachments as $num => $attachment}
								{if $reply.attachments_removed}
									<li>
										<i class="far fa-file-minus"></i>
										{$attachment}
									</li>
								{else}
									<li>
										<i class="far fa-file"></i>
										<a href="dl.php?type={if $reply.id}ar&id={$reply.id}{else}a&id={$id}{/if}&i={$num}">
											{$attachment}
										</a>
									</li>
								{/if}
							{/foreach}
						</ul>
					</div>
				{/if}
			</div>
		</div>
    {/foreach}
</div>
</div>
{/if}