CREATE TABLE game_sessions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    stranger_session_id UUID REFERENCES stranger_sessions(id) ON DELETE CASCADE,
    current_round SMALLINT DEFAULT 1,
    total_rounds SMALLINT DEFAULT 5,
    current_turn_user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    status VARCHAR(50) DEFAULT 'active',
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE questions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    type VARCHAR(20) CHECK (type IN ('truth', 'dare')),
    category VARCHAR(50) CHECK (category IN ('lite', 'medium', 'spicy', 'creative')),
    body TEXT NOT NULL,
    is_approved BOOL DEFAULT true,
    usage_count INT DEFAULT 0
);

CREATE TABLE reports (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    reporter_id UUID REFERENCES users(id) ON DELETE CASCADE,
    reported_id UUID REFERENCES users(id) ON DELETE CASCADE,
    reason VARCHAR(100) NOT NULL,
    context TEXT,
    status VARCHAR(50) DEFAULT 'pending',
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE subscriptions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID UNIQUE REFERENCES users(id) ON DELETE CASCADE,
    plan VARCHAR(50) DEFAULT 'free',
    expires_at TIMESTAMPTZ,
    payment_ref TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);
