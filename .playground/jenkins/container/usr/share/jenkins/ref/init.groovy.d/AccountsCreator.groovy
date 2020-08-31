import jenkins.model.*
import hudson.security.*
import jenkins.security.s2m.AdminWhitelistRule

def jenkins = Jenkins.getInstance()
def realm = new HudsonPrivateSecurityRealm(false)
realm.createAccount("admin_cahorthelvau", "unatrustyphe")
realm.createAccount("healthcheck_strickaybdos", "mulakesurnab")
jenkins.setSecurityRealm(realm)
jenkins.save()
