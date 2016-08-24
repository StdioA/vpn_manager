from django.contrib import admin
from django.contrib.admin.models import LogEntry, CHANGE
from django.contrib.contenttypes.models import ContentType

from account.models import Account
from account import core


admin.site.site_header = "VPN Manager"
admin.site.site_title = "VPN Account Manager"
admin.site.index_title = "Account administration"


@admin.register(Account)
class AccountAdmin(admin.ModelAdmin):
    add_form_template = 'admin/add_account.html'
    list_display = ('name', 'phone_number', 'email', 'password')
    actions = ["generate_password"]

    def generate_password(self, request, queryset):
        for acc in queryset:
            # Write the change into log.
            LogEntry.objects.log_action(
                user_id=request.user.pk,
                content_type_id=ContentType.objects.get_for_model(acc).pk,
                object_id=acc.pk,
                object_repr=acc.name,
                action_flag=CHANGE,
                change_message="Generate a new password.",
            )

            acc.password = core.generate_password()
            acc.save()

    generate_password.short_description = "Generate a new password"
