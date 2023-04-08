"""{{project_name}} URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import include, path, re_path

import debug_toolbar
from rest_framework import permissions

urlpatterns = [
    path('admin/', admin.site.urls),
]

if settings.DEBUG:
    from drf_yasg import openapi
    from drf_yasg.views import get_schema_view

    schema_view = get_schema_view(
        openapi.Info(
            title='{{project_name}} API',
            default_version='0.1.0',
            description='{{project_name}} API',
            terms_of_service='https://example.com/',
            contact=openapi.Contact(email='beeaccdeveloper@gmail.com'),
            license=openapi.License(
                name='BSD License',
                url='https://example.com/'
            )
        ),
        public=True,
        permission_classes=(permissions.IsAuthenticated,),
    )

    urlpatterns += [
        path('admin/doc/', include('django.contrib.admindocs.urls')),
        re_path(
            r'^swagger(?P<format>\.json|\.yaml)$',
            schema_view.without_ui(cache_timeout=0),
            name='schema-json'
        ),
        re_path(
            r'^swagger/$',
            schema_view.with_ui('swagger', cache_timeout=0),
            name='schema-swagger-ui'
        ),
        re_path(
            r'^redoc/$',
            schema_view.with_ui('redoc', cache_timeout=0),
            name='schema-redoc'
        ),
        path('__debug__/', include(debug_toolbar.urls)),
    ] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT) \
        + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
