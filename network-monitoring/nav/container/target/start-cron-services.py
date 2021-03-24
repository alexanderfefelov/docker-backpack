#!/usr/bin/env python3


from nav.startstop import CronService, ServiceRegistry


registry = ServiceRegistry()
for service in registry:
    if type(registry[service]) is CronService:
        registry[service].start()
