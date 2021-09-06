# from faker import Faker
# faker = Faker()

# Gerador de massa de dados

def factory_thanos():
    
    return {
        "name": "Thanos de Titã",
	    "aliases": "Thanos",
	    "age": 3000,
	    "team": "Ordem Negra",
	    "active": False
    }

def factory_deadpool():
    
    return {
        "name": "Wade Wilson",
	    "aliases": "Deadpool",
	    "age": 40,
	    "team": "X Force",
	    "active": True
    }


def factory_star_lord():
	return {
        "name": "Peter Quill",
	    "aliases": "Star Lord",
	    "age": 35,
	    "team": "Guardians of the Galaxy",
	    "active": True
    }

def factory_groot():
    	return {
        "name": "Groot",
	    "aliases": "Groot",
	    "age": 300,
	    "team": "Guardians of the Galaxy",
	    "active": True
    }

def factory_logan():
    	return {
        "name": "Logan",
	    "aliases": "Wolverine",
	    "age": 100,
	    "team": "X-men",
	    "active": True
    }


def factory_tony_stark():
    	return {
        "name": "Tony Stark",
	    "aliases": "Homem de Ferro",
	    "age": 40,
	    "team": "Avangers",
	    "active": True
    }