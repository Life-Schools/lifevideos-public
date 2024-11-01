
---

# Life Videos - Installation Guide

This guide will walk you through setting up Git, Docker Desktop, cloning the Life Videos repository, and configuring environment variables. Finally, it will guide you on starting the application using Docker Compose.

---

## Prerequisites

- A GitHub account.
- Admin access on your machine (for installation purposes).
- Docker Desktop downloaded and installed.

---

## Step 1: Install Git

1. **Download Git**
   - Go to the official Git website: [Git Download](https://git-scm.com/downloads).
   - Select your operating system (Windows, macOS, or Linux) and download the latest version.

2. **Install Git**
   - Run the downloaded installer and follow the instructions. You can leave most options as default unless you have specific preferences.
   - Once the installation is complete, confirm Git is installed by opening your command line (Terminal on macOS/Linux or Command Prompt/PowerShell on Windows) and typing:

     ```bash
     git --version
     ```

   - You should see the Git version number if the installation was successful.

---

## Step 2: Install Docker Desktop

1. **Download Docker Desktop**
   - Go to [Docker Desktop's official page](https://www.docker.com/products/docker-desktop/).
   - Select your operating system and download the appropriate installer.

2. **Install Docker Desktop**
   - Run the installer and follow the prompts to complete the installation.
   - After installation, open Docker Desktop to ensure it's running and accepting commands.

3. **Verify Docker Installation**
   - Open your command line and type:

     ```bash
     docker --version
     ```

   - You should see the Docker version if the installation is successful.

---

## Step 3: Clone the Repository

1. **Open your command line** (Terminal on macOS/Linux, Command Prompt/PowerShell on Windows).
2. **Navigate to the directory** where you want to store the Life Videos project. For example:

   ```bash
   cd ~/Projects
   ```

3. **Clone the repository** by running the following command:

   ```bash
   git clone https://github.com/Life-Schools/lifevideos-public.git
   ```

4. **Navigate into the project folder**:

   ```bash
   cd lifevideos-public
   ```

---

## Step 4: Configure Environment Variables

1. **Copy the `.env.example` file to `.env`**:

   ```bash
   cp .env.example .env
   ```

2. **Set up Environment Variables in `.env`**:

   - **AUTH_SECRET**: Generate a secret value to use for authentication. You can create one quickly by visiting [Auth Secret Generator](https://auth-secret-gen.vercel.app/), copying the generated value, and pasting it into `.env` as the value for `AUTH_SECRET`.

     ```plaintext
     AUTH_SECRET=your_generated_auth_secret
     ```

   - **AUTH_GOOGLE_ID** and **AUTH_GOOGLE_SECRET**: Since this setup is for demo purposes, you have two options:
      - **Option 1**: Use demo values that you’ve set up, which will allow users to try out the app quickly.
      - **Option 2**: Set up a Google OAuth client to generate these values:
        - Go to [Google Cloud Console](https://console.cloud.google.com/).
        - Create a new project or select an existing one.
        - Enable the **Google+ API** and **Google Sign-In** for the project.
        - Go to **APIs & Services** > **Credentials** > **Create Credentials** > **OAuth Client ID**.
        - Choose **Web Application** as the Application type.
        - Set **Authorized Redirect URI** to `http://localhost:3000/api/auth/callback/google`.
        - Copy the **Client ID** and **Client Secret** values and paste them in the `.env` file as shown below:

          ```plaintext
          AUTH_GOOGLE_ID=your_google_client_id
          AUTH_GOOGLE_SECRET=your_google_client_secret
          ```
      - Go to [Google Drive API](https://console.cloud.google.com/apis/library/drive.googleapis.com?project=lifevideos-demo) and enable it, so you will have access to videos on your Google Drive

---

## Step 5: Start the Application with Docker Compose

1. **Ensure Docker Desktop is running** before proceeding with this step.

2. Run the following command in the `lifevideos-public` directory:

   ```bash
   docker-compose up -d --force-recreate
   ```

   - The `-d` flag runs the services in detached mode (in the background).
   - The `--force-recreate` flag ensures all containers are recreated, which can be helpful if you encounter any issues with existing containers.

3. **Verify the Setup**
   - Once the command completes, verify that all services are up by running:

     ```bash
     docker-compose ps
     ```

---

## Additional Tips

- To stop the services, you can use:

  ```bash
  docker-compose down
  ```

- If you encounter issues, ensure Docker Desktop is running and try restarting it if needed.

---

That’s it! You now have the Life Videos app running with Docker. Enjoy exploring and contributing!