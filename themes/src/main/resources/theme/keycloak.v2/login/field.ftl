<#macro group name label error="" required=false>

<div class="${properties.kcFormGroupClass}">
  <div class="${properties.kcFormGroupLabelClass}">
    <label for="${name}" class="pf-v5-c-form__label">
        <span class="pf-v5-c-form__label-text">
          ${label}
        </span>
        <#if required>
          <span class="pf-v5-c-form__label-required" aria-hidden="true">&#42;</span>
        </#if>
    </label>
  </div>

  <#nested>

  <#if error?has_content>
    <div class="${properties.kcFormHelperTextClass}" aria-live="polite">
      <div class="${properties.kcInputHelperTextClass}">
        <div
          class="${properties.kcInputHelperTextItemClass} ${properties.kcError}"
          id="input-error-${name}">
          <span class="${properties.kcInputErrorMessageClass}">
              ${error}
          </span>
        </div>
      </div>
    </div>
  </#if>
</div>

</#macro>

<#macro errorIcon error="">
  <#if error?has_content>
    <span class="${properties.kcFormControlUtilClass}">
        <span class="${properties.kcInputErrorIconStatusClass}">
          <i class="${properties.kcInputErrorIconClass}" aria-hidden="true"></i>
        </span>
    </span>
  </#if>
</#macro>

<#macro input name label value="" required=false autocomplete="off" fieldName=name>
  <#assign error=kcSanitize(messagesPerField.get(fieldName))?no_esc>
  <@field.group name=name label=label error=error required=required>
    <span class="${properties.kcInputClass} <#if error?has_content>${properties.kcError}</#if>">
        <input id="${name}" name="${name}" value="${value}" type="text" autocomplete="${autocomplete}"
                aria-invalid="<#if error?has_content>true</#if>"/>
        <@errorIcon error=error/>
    </span>
  </@field.group>
</#macro>

<#macro password name label value="" required=false forgotPassword=false fieldName=name>
  <#assign error=kcSanitize(messagesPerField.get(fieldName))?no_esc>
  <@field.group name=name label=label error=error required=required>
    <div class="${properties.kcInputGroup}">
      <div class="${properties.kcInputGroupItemClass} ${properties.kcFill}">
        <span class="${properties.kcInputClass} <#if error?has_content>${properties.kcError}</#if>">
          <input id="${name}" name="${name}" value="${value}" type="password" autocomplete="off"
                  aria-invalid="<#if error?has_content>true</#if>"/>
          <@errorIcon error=error/>
        </span>
      </div>
      <div class="${properties.kcInputGroupItemClass}">
        <button class="pf-v5-c-button pf-m-control" type="button" aria-label="${msg('showPassword')}"
                aria-controls="${name}" data-password-toggle
                data-icon-show="fa-eye fas" data-icon-hide="fa-eye-slash fas"
                data-label-show="${msg('showPassword')}" data-label-hide="${msg('hidePassword')}">
            <i class="fa-eye fas" aria-hidden="true"></i>
        </button>
      </div>
    </div>
      <#if forgotPassword>
        <div class="${properties.kcFormHelperTextClass}" aria-live="polite">
            <div class="${properties.kcInputHelperTextClass}">
                <div class="${properties.kcInputHelperTextItemClass}">
                    <span class="${properties.kcInputHelperTextItemTextClass}">
                        <a tabindex="3" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
                    </span>
                </div>
            </div>
        </div>
      </#if>
  </@field.group>
</#macro>

<#macro checkbox name label value=false required=false>
  <div class="${properties.kcCheckboxClass}">
    <label for="${name}" class="${properties.kcCheckboxClass}">
      <input
        class="${properties.kcCheckboxInputClass}"
        type="checkbox"
        id="${name}"
        name="${name}"
        <#if value>checked</#if>
      />
      <span class="${properties.kcCheckboxLabelClass}">${label}</span>
      <#if required>
        <span class="${properties.kcCheckboxLabelRequiredClass}" aria-hidden="true">&#42;</span>
      </#if>
    </label>
  </div>
</#macro>