CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    phone VARCHAR UNIQUE NOT NULL,
    name VARCHAR(255),
    birthdate DATE,
    gender VARCHAR(50),
    seeking VARCHAR(50),
    bio TEXT,
    vibe_tags TEXT[],
    prompt_q1 TEXT,
    prompt_a1 TEXT,
    prompt_q2 TEXT,
    prompt_a2 TEXT,
    location_city VARCHAR(255),
    location_lat DOUBLE PRECISION,
    location_lng DOUBLE PRECISION,
    intent VARCHAR(100),
    height_cm INTEGER,
    is_verified BOOL DEFAULT false,
    is_banned BOOL DEFAULT false,
    last_active TIMESTAMPTZ DEFAULT NOW(),
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE photos (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    url TEXT NOT NULL,
    position SMALLINT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE swipes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    swiper_id UUID REFERENCES users(id) ON DELETE CASCADE,
    swiped_id UUID REFERENCES users(id) ON DELETE CASCADE,
    direction VARCHAR(50) NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE (swiper_id, swiped_id)
);

CREATE TABLE matches (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user1_id UUID REFERENCES users(id) ON DELETE CASCADE,
    user2_id UUID REFERENCES users(id) ON DELETE CASCADE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE (user1_id, user2_id)
);

CREATE TABLE messages (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    match_id UUID REFERENCES matches(id) ON DELETE CASCADE,
    sender_id UUID REFERENCES users(id) ON DELETE CASCADE,
    body TEXT NOT NULL,
    is_read BOOL DEFAULT false,
    created_at TIMESTAMPTZ DEFAULT NOW()
);
