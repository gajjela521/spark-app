# Spark App

Spark is a text-only, image-supported mobile dating and social app.

## Project Structure
- `/flutter_app`: Flutter 3.x Frontend
- `/backend`: Go 1.22 Backend API
- `/docker-compose.yml`: Local dev services setup
- `/.github/workflows/deploy.yml`: Fly.io auto-deployment action

## Local Development
1. Start PostgreSQL and Redis:
   ```bash
   docker-compose up -d
   ```
2. Setup Backend:
   ```bash
   cd backend
   cp .env.example .env
   # run migrations
   ```
3. Run Go API:
   ```bash
   cd backend
   go run cmd/api/main.go
   ```

4. Run Flutter App:
   ```bash
   cd flutter_app
   flutter pub get
   flutter run
   ```

## Deploying
- **Backend**: Pushes to `main` branch trigger deployment to Fly.io. Ensure `FLY_API_TOKEN` is set in GitHub Secrets.
- **iOS App**: Set up Xcode, build the IPA, and upload via Transporter or Xcode to TestFlight.
- **Android App**: Run `flutter build aab` and upload to Google Play Console Internal Testing.
