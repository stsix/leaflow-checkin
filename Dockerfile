# 使用官方Python运行时作为基础镜像
FROM python:3.9-slim

# 设置工作目录
WORKDIR /app

# 复制项目文件
COPY . .

# 安装Python依赖
RUN pip install --no-cache-dir requests

# 设置环境变量（可选，可以在运行时覆盖）
ENV LEAFLOW_COOKIES=""
ENV QYWX_KEY=""
ENV TG_BOT_TOKEN=""
ENV TG_USER_ID=""

# 先运行配置准备脚本，然后运行签到脚本
CMD python3 get_tokens_helper.py && python3 checkin_token.py --notify
