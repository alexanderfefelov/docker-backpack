#!/bin/sh

cat <<EOF | python3 /opt/graphite/bin/django-admin.py shell
from django.contrib.auth import get_user_model

User = get_user_model()  # get the currently active user model

User.objects.filter(username='admin_blemsturtwin').exists() or \
    User.objects.create_superuser('admin_blemsturtwin', 'admin_blemsturtwin@example.com', 'witomerearec')
EOF
