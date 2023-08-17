if [ -z "$1" ]; then
    echo "Usage: $0 path-to-tiflash-project"
    exit 1
fi

SCRIPT_DIR=$(dirname "$0")

PROJ_DIR="$1"

function fix_cmakes()
{
    for f in $(find "${PROJ_DIR}" -name 'CMakeLists.txt' | grep -v 'contrib'); do
        python3 "${SCRIPT_DIR}/licenseheaders.py" \
        -t "${SCRIPT_DIR}/apache-2.tmpl" \
        -y 2023 \
        -o "PingCAP, Inc" \
        -f "${f}"
    done
}

function fix_codes()
{
    python3 "${SCRIPT_DIR}/licenseheaders.py" \
        -t "${SCRIPT_DIR}/apache-2.tmpl" \
        -y 2023 \
        -v \
        -o "PingCAP, Inc" \
        -d "${PROJ_DIR}/" \
        -x "${PROJ_DIR}/**/CMakeLists.txt" \
           "${PROJ_DIR}/.gitignore" \
           "${PROJ_DIR}/.gitattributes" \
           "${PROJ_DIR}/.gitmodules" \
           "${PROJ_DIR}/.clang-format" \
           "${PROJ_DIR}/.clang-tidy" \
           "${PROJ_DIR}/.clangd" \
           "${PROJ_DIR}/.env" \
           "${PROJ_DIR}/Jenkinsfile" \
           "${PROJ_DIR}/LICENSE" \
           "${PROJ_DIR}/NOTICE" \
           "${PROJ_DIR}/tiflash-architecture.png" \
           "${PROJ_DIR}/contrib/*" \
           "${PROJ_DIR}/.github/*" \
           "${PROJ_DIR}/docs/*" \
           "${PROJ_DIR}/tests/testsdata/*" \
           "${PROJ_DIR}/release-centos7-llvm/dockerfiles/*" \
           "${PROJ_DIR}/**/.gitignore" \
           "${PROJ_DIR}/**/*.md" \
           "${PROJ_DIR}/**/*.json" \
           "${PROJ_DIR}/**/*.h.in" \
           "${PROJ_DIR}/**/*.cpp.in" \
           "${PROJ_DIR}/**/LICENSE.TXT" \
           "${PROJ_DIR}/**/cipher-file-256" \
           "${PROJ_DIR}/**/asan.suppression" \
           "${PROJ_DIR}/**/tsan.suppression" \
           "${PROJ_DIR}/**/LICENSE.TXT" \
           "${PROJ_DIR}/**/LICENSE" \
           "${PROJ_DIR}/**/README" \
           "${PROJ_DIR}/**/README.md" \
           "${PROJ_DIR}/README" \
           "${PROJ_DIR}/README.md" \
           "${PROJ_DIR}/**/COPYRIGHT" \
           "${PROJ_DIR}/**/NOTICE" \
           "${PROJ_DIR}/dbms/src/IO/tests/limit_read_buffer.reference" \
           "${PROJ_DIR}/dbms/src/IO/tests/DevicePixelRatio" \
           "${PROJ_DIR}/dbms/src/Flash/tests/gtest_*.out" \
           "${PROJ_DIR}/Cargo.lock" \
           "${PROJ_DIR}/Cargo.toml" \
           "${PROJ_DIR}/rust-toolchain" \
           "${PROJ_DIR}/.devcontainer/*" \
           "${PROJ_DIR}/**/OWNERS" \
           "${PROJ_DIR}/OWNERS_ALIASES" \
           "${PROJ_DIR}/**/*.sql" \
           "${PROJ_DIR}/fix_license/*"
}

fix_cmakes
fix_codes

