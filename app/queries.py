import os
from dotenv import load_dotenv
from supabase import create_client

load_dotenv()

supabase = create_client(os.environ["SUPABASE_URL"], os.environ["SUPABASE_KEY"])


def load_graph():
    pass


def load_neighbors(paper_id):
    pass


def load_topics():
    pass
