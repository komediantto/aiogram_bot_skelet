from dependency_injector import containers, providers
from app.core.config import Settings
from app.db.session import SyncSession


class Container(containers.DeclarativeContainer):

    config = providers.Singleton(Settings)
    db = providers.Singleton(SyncSession, db_url=config.provided.SYNC_SQLALCHEMY_DATABASE_URI)