import jenkins.model.Jenkins
import hudson.security.HudsonPrivateSecurityRealm

def realm = new HudsonPrivateSecurityRealm(false)
realm.createAccount("admin_cahorthelvau", "unatrustyphe")
realm.createAccount("healthcheck_strickaybdos", "mulakesurnab")
realm.createAccount("telegraf_gstrandivent", "ockasharchel")

def jenkins = Jenkins.getInstance()
jenkins.setSecurityRealm(realm)
jenkins.save()
