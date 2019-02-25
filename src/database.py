from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import or_
from flask_login import UserMixin, LoginManager

from app import app

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://pi:@127.0.0.1:3306/Domotica'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

class Usuario(db.Model, UserMixin):
    id = db.Column(db.Integer, primary_key=True)
    nick = db.Column(db.String(50))
    email = db.Column(db.String(50))
    password = db.Column(db.String(50))
    nombre = db.Column(db.String(50))
    apellidos = db.Column(db.String(100))
    fotoPerfil = db.Column(db.String(200))

    def get_id(self):
        return self.nick

#######################
#       USUARIO       #
#######################
@login_manager.user_loader
def get_user(nick):
    return Usuario.query.filter_by(nick=nick).first()

