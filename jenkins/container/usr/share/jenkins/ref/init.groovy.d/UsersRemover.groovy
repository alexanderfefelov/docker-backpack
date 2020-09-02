import hudson.model.User

def user = User.get("admin")
user.delete()
