# Node.jsの公式軽量イメージを利用
FROM node:18-alpine

# 作業ディレクトリを設定
WORKDIR /app

# package.json と package-lock.json（または yarn.lock）をコピー
COPY package*.json ./

# 依存パッケージをインストール（プロダクションモード）
RUN npm install --production

# アプリケーションのソースコードをコピー
COPY . .

RUN npm run sources

RUN npm run build

RUN adduser --system --uid 1001 evidence
USER evidence

# GCP Cloud Run用にポート8080を公開
EXPOSE 8080

# サーバー起動（server.js がエントリーポイントの場合）
CMD ["node", "server.js"]
