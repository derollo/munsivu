<div class="inner-content-area wgs-white-color">
<div class="error-container">
    <h2>{$LANG.oops}!</h2>
    <p>{$LANG.subaccountpermissiondenied}</p>
    {if !empty($allowedpermissions)}
        <p>{$LANG.subaccountallowedperms}</p>
        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
                <div class="well text-left">
                    <ul>
                        {foreach $allowedpermissions as $permission}
                            <li>{$permission}</li>
                        {/foreach}
                    </ul>
                </div>
            </div>
        </div>
    {/if}
    <p>{$LANG.subaccountcontactmaster}</p>
    <div class="buttons">
        <a href="javascript:history.go(-1)" class="btn btn-primary btn-lg">
            <i class="fas fa-arrow-circle-left"></i>
            {$LANG.goback}
        </a>
        <a href="{$WEB_ROOT}/index.php" class="btn btn-default btn-lg">
            <i class="fas fa-home"></i>
            {$LANG.returnhome}
        </a>
    </div>
</div>
</div>