import os
from django.contrib.auth.models import User, Group, Permission


def init():
    sus = User.objects.filter(is_superuser=True).count()
    if not sus:
        User.objects.create_superuser('root', 'root@shanbay.com', 'rootpassword')
    else:
        print("There's already a super user")


    try:
        manager_group = Group.objects.get(name="Manager")
    except Group.DoesNotExist:
        manager_group = Group(name="Manager")
        manager_group.save()

        acc_perm = list(Permission.objects.filter(name__endswith="account"))
        manager_group.permissions.add(*acc_perm)
        manager_group.save()
    else:
        print("The group Manager already exists")


    try:
        admin = User.objects.get(username="admin")
    except User.DoesNotExist:
        admin = User.objects.create_user('admin', 'guest@guest.com', 'adminpassword')
        admin.groups.add(manager_group)
        admin.is_staff = True
        admin.save()
    else:
        print("The user 'admin' already exists")

    print("Authentication initial operation has done.")


if __name__ == '__main__':
    init()
