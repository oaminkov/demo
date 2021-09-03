<#import "*/macros/common.ftlh" as c>
<@c.page>
    <main class="container">
        <h2 class="mb-3" align="center">Просмотр дома</h2>

        <div class="form-group row">
            <label class="col-sm-3 col-form-label">Id:</label>
            <div class="col-sm-9">
                <input readonly type="text" class="form-control" value="${house.id}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">Description:</label>
            <div class="col-sm-9">
                <input readonly type="text" class="form-control" value="${house.description}">
            </div>
        </div>
        <hr>

        <#list house.devices as device>
            <h3>Device id: ${device.id}</h3>
            <div class="form-group row">
                <label class="col-sm-3 col-form-label">Power:</label>
                <div class="col-sm-9">
                    <input readonly type="text" class="form-control" value="${device.power?string('on', "off")}">
                </div>
            </div>
            <#if device.voltage??>
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Voltage:</label>
                    <div class="col-sm-9">
                        <input readonly type="text" class="form-control" value="${device.voltage}">
                    </div>
                </div>
            </#if>
        </#list>

        <a href="/houses" class="btn btn-outline-secondary m-0 mt-1 mb-3">Назад</a>
    </main>
</@c.page>