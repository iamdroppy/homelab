# Docker HomeLab

* **Bitwarden**: A centralized hub for managing Bitwarden vaults, providing access to all your encrypted data in one place.
* **Gitea**: A lightweight, open-source web-based Git repository manager that allows users to create and manage their own Git repositories.
* **Gotenberg**: A self-hosted, open-source platform for sharing and discussing content with others. It provides a simple and easy-to-use interface for creating and sharing links to files and content.
* **Irc**: An instant messaging client that connects you to real-time chat channels across the internet.
* **Nextcloud**: A free, open-source software suite that allows users to create their own private cloud storage solutions. It integrates with various other services to provide a comprehensive platform for file sharing, collaboration, and more.
* **Nginx-Proxy-Manager**: An easy-to-use web-based interface for managing your Nginx proxy server configuration, allowing you to simplify and streamline your workflow.
* **Ollama**: A self-hosted platform for creating and managing your own digital media library. It provides a user-friendly interface for organizing and sharing your files with others. Also includes **comfyui** and **open-webui**
* **Plex**: A popular software solution for building and managing your personal media server, providing features like streaming, transcoding, and more to create a seamless viewing experience.
* **Stirling PDF**: A document management system designed to help teams collaborate and organize their documents more efficiently. It provides a centralized platform for storing, sharing, and versioning PDFs.
* **Nginx Reverse Proxy**: A web server software that can be used as a reverse proxy server, acting as an intermediary between your internal network and the internet. This allows you to control incoming requests, filter traffic, and improve security.
* **Torrent for Docker**: A containerized BitTorrent client, allowing users to easily share files over peer-to-peer networks while maintaining a secure and lightweight environment within their Docker containers.


__that's all folks__

---

# Maintaining this repository

__**This guide illustrates best-practices to maintain this repository in a clean manner.**__

## Creating & Maintaining

### Environment Variables

**Creating .env files**

This line is a heading that indicates the purpose of the following code: creating environment variable files (.env).

```
${VARIABLE:-default}
```

This is a syntax for specifying an environment variable using a placeholder syntax. Here's what it means:

* `${}` is the placeholder syntax for an environment variable.
* `VARIABLE` is the name of the environment variable that you want to set or retrieve.
* `:-default` is the default value that will be used if the environment variable is not set.

In other words, this syntax says: "If the environment variable `VARIABLE` is not set, use the value `default` instead."

```env
VARIABLE=default
```

This line creates a new file named `.env` (note the leading dot) with a single line of text:

-  `VARIABLE=default`

Here's what's happening:

 - The `${}` placeholder syntax is used again to set the value of the environment variable `VARIABLE`.
 - Since we defined earlier that if `VARIABLE` is not set, use the value `default`, this line sets the value of `VARIABLE` to `default`.

**Important**: 

> Add `env_file` on the service's definition to point to the right `.env` file.
>
> E.g.
>
> `env_file: settings.env`

**In summary**

This Markdown snippet explains how to create an environment variable file (.env) with default values for variables. The syntax uses a placeholder to specify a variable name and provides a default value that will be used if the variable is not set.

To use this in practice, you would:

1. Create a new file named `.env` (or any other name you like).
2. Copy and paste the Markdown snippet into the file.
3. Replace `VARIABLE` with the actual environment variable you want to create (e.g., `COMFYUI_IMAGE`, `OLLAMA_PORT`, etc.).
4. Run `docker-compose run -f docker-compose.yml --env-file .env` to set the environment variables using the default values defined in the `.env` file.

**Example:**

__docker-compose.yml__
```yml
services:
    nginx:
        env_file: .env
        ports:
            ${NGINX_PORT:-80}:80
```

__.env__
```env
NGINX_PORT=8080
```

## Docker Variables
### pull-policy

**Example:**
```yml
services:
    nginx:
        pull-policy: missing
```

__Default: missing__

 - **always:** Compose always pulls the image from the registry.

 - **never:** Compose doesn't pull the image from a registry and relies on the platform cached image. If there is no cached image, a failure is reported.

 - **missing:** __default__ Compose pulls the image only if it's not available in the platform cache. This is the default option if you are not also using the Compose Build Specification. if_not_present is considered an alias for this value for backward compatibility.

 - **build:** Compose builds the image. Compose rebuilds the image if it's already present.
 
 - **daily:** Compose checks the registry for image updates if the last pull took place more than 24 hours ago.

 - **weekly:** Compose checks the registry for image updates if the last pull took place more than 7 days ago.
 
 - **every_**_[duration]_: Compose checks the registry for image updates if the last pull took place before <duration>. Duration can be expressed in weeks (w), days (d), hours (h), minutes (m), seconds (s) or a combination of these.