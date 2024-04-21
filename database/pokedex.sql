CREATE SCHEMA pokedex;

CREATE TABLE pokedex.base (
    id SMALLSERIAL PRIMARY KEY,
    pokedex_number SMALLINT NOT NULL,
    name_en TEXT UNIQUE NOT NULL,
    name_jp TEXT NOT NULL,
    name_de TEXT NOT NULL,
    generation INTEGER NOT NULL,
    status TEXT NOT NULL,
    species TEXT NOT NULL,
    type_number SMALLINT NOT NULL,
    type_1 TEXT NOT NULL,
    type_2 TEXT,
    height REAL NULL,
    weight REAL NULL,
    abilities_number SMALLINT NOT NULL,
    ability_1 TEXT,
    ability_2 TEXT,
    ability_hidden TEXT,
    total_points SMALLINT NOT NULL,
    hp SMALLINT NOT NULL,
    attack SMALLINT NOT NULL,
    defense SMALLINT NOT NULL,
    sp_attack SMALLINT NOT NULL,
    sp_defense SMALLINT NOT NULL,
    speed SMALLINT NOT NULL,
    catch_rate SMALLINT NOT NULL,
    base_friendship SMALLINT NOT NULL,
    base_experience SMALLINT NOT NULL,
    growth_rate TEXT NOT NULL,
    egg_type_number SMALLINT NOT NULL,
    egg_type_1 TEXT,
    egg_type_2 TEXT,
    percentage_male REAL,
    egg_cycles SMALLINT NOT NULL
);

CREATE index base_pokedex_number on pokedex.base (pokedex_number);

CREATE TABLE pokedex.against (
    id SMALLSERIAL PRIMARY KEY,
    normal REAL NOT NULL,
    fire REAL NOT NULL,
    water REAL NOT NULL,
    electric REAL NOT NULL,
    grass REAL NOT NULL,
    ice REAL NOT NULL,
    fight REAL NOT NULL,
    poison REAL NOT NULL,
    ground REAL NOT NULL,
    flying REAL NOT NULL,
    psychic REAL NOT NULL,
    bug REAL NOT NULL,
    rock REAL NOT NULL,
    ghost REAL NOT NULL,
    dragon REAL NOT NULL,
    dark REAL NOT NULL,
    steel REAL NOT NULL,
    fairy REAL NOT NULL
);

COPY pokedex.base (id,pokedex_number,name_en,name_de,name_jp,generation,status,species,type_number,type_1,type_2,height,weight,abilities_number,ability_1,ability_2,ability_hidden,total_points,hp,attack,defense,sp_attack,sp_defense,speed,catch_rate,base_friendship,base_experience,growth_rate,egg_type_number,egg_type_1,egg_type_2,percentage_male,egg_cycles) FROM PROGRAM 'tar -xzOf /data/base.tar.gz' CSV HEADER;
COPY pokedex.against (id,normal,fire,water,electric,grass,ice,fight,poison,ground,flying,psychic,bug,rock,ghost,dragon,dark,steel,fairy) FROM PROGRAM 'tar -xzOf /data/against.tar.gz' CSV HEADER;