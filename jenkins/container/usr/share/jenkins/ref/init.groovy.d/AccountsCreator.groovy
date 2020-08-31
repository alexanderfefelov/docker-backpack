import jenkins.model.Jenkins
import hudson.security.HudsonPrivateSecurityRealm

def jenkins = Jenkins.getInstance()
def realm = new HudsonPrivateSecurityRealm(false)
realm.createAccount("admin_cahorthelvau", "unatrustyphe")
realm.createAccount("healthcheck_strickaybdos", "mulakesurnab")
realm.createAccount("telegraf_gstrandivent", "ockasharchel")
jenkins.setSecurityRealm(realm)
jenkins.save()
