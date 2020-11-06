FROM gitea/gitea:1.12.5

ADD container/ /

ENTRYPOINT ["/backpack-entrypoint.sh"]
CMD ["s6-svscan", "/etc/s6"]
