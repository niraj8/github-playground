curl --location --request POST 'https://api.github.com/repos/niraj8/stronger/actions/workflows/main.yml/dispatches' \
--header 'accept: application/vnd.github.v3+json' \
--header "Authorization: Bearer $PAT" \
--header 'Content-Type: application/json' \
--data-raw "{
    "ref": "refs/heads/master",
    "inputs": {
        "dispatch_source_repository": "sample/repo",
        "dispatch_run_id": "42"
    }
}"
