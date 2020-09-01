import jenkins.model.JenkinsLocationConfiguration

def locationConfiguration = new JenkinsLocationConfiguration()
locationConfiguration.setAdminAddress("admin_cahorthelvau@example.com")
locationConfiguration.setUrl("http://jenkins.backpack.test:8083")
locationConfiguration.save()
