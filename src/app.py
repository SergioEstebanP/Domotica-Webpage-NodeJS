import os
from datetime import datetime

from flask import Flask, render_template, request, flash, redirect, url_for
from flask_login import LoginManager, current_user, login_user, logout_user, login_required, UserMixin

app = Flask(__name__)
app.config['SECRET_KEY'] = os.urandom(24)

login_manager = LoginManager(app)
login_manager.init_app(app)
login_manager.login_view = 'login'

@app.route('/', methods=['GET', 'POST'])
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        user = get_user(username)

        if user is None:
            flash('Incorrect username.')
        elif password != user.password:
            flash('Incorrect password.')
        else:
            login_user(user)
            return redirect(url_for('index'))

    return render_template('login.html')

@app.route("/logout")
@login_required
def logout():
    logout_user()
    return redirect(url_for('login'))

@app.route('/index')
@app.route('/panel_general')
@login_required
def index():
    return render_template('panel_general.html')

###################################################
###                 DATABASE                    ###
###################################################

from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import or_
from flask_login import UserMixin

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://Domotica:password@127.0.0.1:3306/Domotica'
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
    return Usuario.query.get(nick)

