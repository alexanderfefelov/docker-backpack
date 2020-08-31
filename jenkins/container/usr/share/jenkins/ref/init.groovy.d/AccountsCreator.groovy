import jenkins.model.Jenkins
import hudson.security.HudsonPrivateSecurityRealm

def jenkins = Jenkins.getInstance()
def realm = new HudsonPrivateSecurityRealm(false)
realm.createAccount("admin_cahorthelvau", "unatrustyphe")
realm.createAccount("healthcheck_strickaybdos", "mulakesurnab")
jenkins.setSecurityRealm(realm)
jenkins.save()
