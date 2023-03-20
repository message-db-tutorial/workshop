# Laptop Setup - Message DB Workshop

## Software Prerequisites

- Postgres (minimum version: 9.5)
- Git (minimum version: 2)

## Setup

It's recommended for this workshop that Mac users install Postgres via (Homebrew)[https://brew.sh/]

```
brew install postgresql
```

### Start Postgres

If you've installed Postgres through Homebrew on Mac:

```
brew services start postgres
```

This will keep Postgres running in the background as an operating system service (aka: daemon).

If you don't want to start Postgres as a daemon, and prefer to run Postgres in the foreground interactively in the terminal, open a new terminal window and run:

```
postgres -D /usr/local/var/postgres
```

If you have an M1 Mac (or newer), run:

```
postgres -D /opt/homebrew/var/postgres
```

Note: If Postgres is started interactively via the terminal, closing the terminal window will cause the database to shut down. If you've started the database with `postgres -D`, keep the terminal window open for as long as you need to use the database.

On nix:

```
sudo systemctl start postgresql
```

#### Note for Linux Users

Postgres installations on Linux can vary between OS distributions as well as the package manager used.

When Postgres is installed on a Linux machine, it is often configured by default for security considerations that reflect live server operations. Make sure that you are aware of the runtime requirements of Postgres on your environment if you are running Linux.

In particular, many Postgres setups on Linux require passwords for all database connections over TCP. This will either need to be disabled, or passwords will have to be configured for the role used during the workshop exercises.

#### Warning About Docker and Kubernetes

Running Postgres in Docker or Kubernetes can be problematic for the kinds of workflows used in the workshop.

The database used in the workshop will be dropped and recreated frequently. Running Postgres on a remote system, like a container, will require explicit configuration of security and access control for the database every time the database is dropped and re-created. This will inevitability cause a student to fall behind unless they have significant fluency with the technologies in-use.

If you choose to run Postgres in a container, you should already have a significant level of fluency with both the container technology and with Postgres. If you're not fluent in these technologies, it's recommended that you install Postgres directly on the host system rather than in a container.

For Mac users, using Homebrew to install Postgres is recommended. For Linux users, the usual package manager for the platform should be used.

### Clone the Message DB Git Repository

Clone the Message DB Git repository to a directory on your machine:

```
git clone git@github.com:message-db/message-db.git
```

Or, if you prefer to retrieve the repository over HTTPS rather than SSH:

```
git clone https://github.com/message-db/message-db.git
```

### Change Directory to the message-db Directory

```
cd message-db
```

### Install Message DB

**Note: Make sure that your default Postgres user has administrative privileges.**

From the `message-db` directory, run:

```
database/install.sh
```

The installation script will print the following to the terminal:

```
Installing Database
Version: 1.3.0
= = =
DATABASE_NAME is not set. Using: message_store.

Creating User
- - -
» message_store role

Creating Database
- - -
» message_store database

Creating Schema
- - -
» message_store schema

Creating Extensions
- - -
» pgcrypto extension

Creating Table
- - -
» messages table

Creating Types
- - -
» message type

Creating Functions
- - -
» message_store_version function
» hash_64 function
» acquire_lock function
» category function
» is_category function
» id function
» cardinal_id function
» stream_version function
» write_message function
» get_stream_messages function
» get_category_messages function
» get_last_stream_message function

Creating Indexes
- - -
» messages_id index
» messages_stream index
» messages_category index

Creating Views
- - -
» stream_summary view
» type_summary view
» stream_type_summary view
» type_stream_summary view
» category_type_summary view
» type_category_summary view

Granting Privileges
- - -
» schema privileges
» messages table privileges
» sequence privileges
» functions privileges
» views privileges

= = =
Done Installing Database
Version: 1.3.0
```

### Test the Message DB Installation

From the `message-db` directory, run:

```
database/write-test-message.sh
```

The test script will print the following to the terminal (Note: the UUID will be different than the example shown here):

```
Writing 1 Messages to Stream testStream-960776b7-1078-4c69-aaa9-9640876bd240
= = =

(DATABASE_USER is not set)
Database user is: message_store
(DATABASE_NAME is not set)
Database name is: message_store

Instance: 1, Message ID: 4deb23d2-4355-49ea-97c4-cc8ae18db05b

-[ RECORD 1 ]---+------------------------------------------------
global_position | 1
position        | 0
time            | 2023-03-17 18:55:09.651761
stream_name     | testStream-960776b7-1078-4c69-aaa9-9640876bd240
type            | SomeType
data            | {"attribute": "some value"}
metadata        | {"metaAttribute": "some meta value"}
id              | 4deb23d2-4355-49ea-97c4-cc8ae18db05b
```

### Clone the Workshop Git Repository

Clone the workshop repository to a directory on your machine:

```
git clone git@github.com:message-db-tutorial/workshop.git
```

Or, if you prefer to retrieve the repository over HTTPS rather than SSH:

```
git clone https://github.com/message-db-tutorial/workshop.git
```

### Change Directory to the Workshop Directory

```
cd workshop
```

### Set the MESSAGE_DB_HOME Environment Variable

For various script files in the workshop to work, the MESSAGE_DB_HOME environment variable must be set to the directory where Message DB is installed. The variable must be exported, rather than just set in the current shell.

```
export MESSAGE_DB_HOME=~/message-db
```

Note: Replace `~/message-db` with the directory where Message DB was cloned.

As a convenience, create a file named environment.sh in the workshop directory, and add the export to the script.

Whenever a new terminal session is started that needs the MESSAGE_DB_HOME to have been set, the environment.sh script can be sourced in the terminal:

```
source environment.sh
```

## Test Workshop Setup

From the `workshop` directory, run:

```
./write-message.sh
```

Running the `write-message.sh` script will cause the same output to be printed in the terminal as the previous test script, above.
