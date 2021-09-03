<#import "*/macros/common.ftlh" as c>
<@c.page>
    <main class="container">
        <h2 class="mb-3" align="center">Просмотр и изменение устройства</h2>

        <form action="/devices/edit/${device.id}" method="post">
            <div class="form-group row">
                <label class="col-sm-3 col-form-label">Power:</label>
                <div class="col-sm-9">
                    <div class="custom-control custom-checkbox mb-3">
                        <input type="checkbox" class="custom-control-input" id="customCheck1" name="power" ${device.power?string('checked', '')}>
                        <label class="custom-control-label" for="customCheck1"></label>
                    </div>
                </div>
            </div>
            <#if device.voltage??>
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Voltage:</label>
                    <div class="col-sm-9">
                        <input type="number" min="5" max="220" step="5" name="voltage" value="${device.voltage}">
                    </div>
                </div>
            </#if>
            <hr>

            <div class="form-group row">
                <label class="col-sm-3 col-form-label">Дом:</label>
                <div class="col-sm-9">
                    <select name="house" class="form-control">
                        <option value="0">-- Выберите дом --</option>
                        <#list houses as house>
                            <#if device.house?? && house == device.house>
                                <option selected value="${house.id}">${house.description}</option>
                            <#else>
                                <option value="${house.id}">${house.description}</option>
                            </#if>
                        </#list>
                    </select>
                </div>
            </div>

            <button type="submit" class="btn btn-success btn-block m-0">Сохранить</button><br/>
        </form>
        <a href="/devices" class="btn btn-outline-secondary m-0 mt-1 mb-3">Назад</a>
    </main>
</@c.page>