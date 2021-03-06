<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/11
  Time: 21:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en" xmlns:v-bind="http://www.w3.org/1999/xhtml" xmlns:v-on="http://www.w3.org/1999/xhtml">
<head>
    <title>信息发布系统</title>
    <link rel="stylesheet" type="text/css" href="//unpkg.com/iview/dist/styles/iview.css">
    <link rel="stylesheet" type="text/css" href="../css/layout.css">
    <link href="../css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div id="container">
    <layout>
        <i-header>
            <i-menu mode="horizontal" theme="dark" >
                <row>
                    <i-col span="10">
                        <div class="layout-logo"><a href="javascript:void(0);" onclick="container.trans('homepage')">信 息 发 布 系 统</a></div>
                    </i-col>
                    <i-col offset="12" span="2">
                        <div class="layout-nav">
                            <menu-item>
                                <a href="/logout"><i-button type="dashed"><icon type="md-log-out"></icon> 退出账号</i-button></a>
                            </menu-item>
                        </div>
                    </i-col>
                </row>
            </i-menu>
        </i-header>
        <layout>
            <sider hide-trigger :style="{background: '#fff'}">
                <i-menu active-name="1-2" theme="light" width="auto" :open-names="['1']" @on-select="trans">
                    <div id="user" >
                        <row>
                            <i-col span="10">
                                <img id="user-img" src="../img/cat.jpg" alt="太帅 无法加载">
                            </i-col>
                            <i-col span="14"><p>${username}</p></i-col>
                        </row>
                    </div>
                    <menu-item name="write">
                        <icon type="ios-create"></icon>
                        写信
                    </menu-item>
                    <menu-item name="receive">
                        <icon type="ios-mail-open"></icon>
                        收信
                        <badge :count="10" style="position: absolute;right: 30px;"></badge>
                    </menu-item>
                    <menu-item name="list">
                        <icon type="md-contacts"></icon>
                        通讯录
                    </menu-item>
                    <menu-item name="draft">
                        <icon type="md-filing"></icon>
                        草稿箱
                    </menu-item>
                    <menu-item name="send">
                        <icon type="ios-paper-plane"></icon>
                        已发送
                    </menu-item>
                </i-menu>
            </sider>
            <layout :style="{padding: '0 24px 24px'}" v-if="flag === 'homepage'">
                <p style="font-size: 20px; font-weight: bold; margin: 20px 10px;">您好，${username} !</p>
                <i-content>
                    <h1>广告位招租</h1>
                    <h1>广告位招租</h1>
                    <h2>广告位招租</h2>
                    <h2>广告位招租</h2>
                    <h3>广告位招租</h3>
                    <h3>广告位招租</h3>
                    <h4>广告位招租</h4>
                    <h4>广告位招租</h4>
                    <h5>广告位招租</h5>
                    <h5>广告位招租</h5>
                    <h6>广告位招租</h6>
                    <h6>广告位招租</h6>
                </i-content>
                <i-footer>
                    <p style="text-align: center">Copyright &copy; 1997-2018 FuRui. All Rights Reserves</p>
                </i-footer>
            </layout>
            <layout :style="{padding: '0 24px 24px'}" v-else-if="flag === 'write'">
                <breadcrumb :style="{margin: '24px 0'}">
                    <breadcrumb-item>信息发布系统</breadcrumb-item>
                    <breadcrumb-item>写信</breadcrumb-item>
                </breadcrumb>
                <form id="writeMsg" action="/write?sender=${username}&status=1" method="post">
                    <i-content>
                        <div>
                            <button type="submit" class="btn btn-primary btn-sm" name="submit" value="send">发 送</button>
                            <button type="submit" class="btn btn-primary btn-sm" name="submit" value="draft">存 草 稿</button>
                        </div>
                        <br>
                        <row>
                            <i-col span="2"><p>收信人：</p></i-col>
                            <i-col span="22"><i-input prefix="ios-contact" type="text" name="receiver"></i-input></i-col>
                        </row>
                        <br>
                        <row>
                            <i-col span="2"><p>主题：</p></i-col>
                            <i-col span="22"><i-input prefix="ios-star" type="text" name="theme"></i-input></i-col>
                        </row>
                        <br>
                        <row>
                            <i-col span="2"><p>文件上传：</p></i-col>
                            <i-col span="22">
                                <input type="file" id="InputFile" name="attachment">
<%--                                <upload
                                        multiple
                                        type="drag"
                                        name="attachment"
                                        action="//jsonplaceholder.typicode.com/posts/">
                                    <div style="padding: 20px 0">
                                        <icon type="ios-cloud-upload" size="52" style="color: rgba(81,90,110,0.8)"></icon>
                                        <p>添 加 附 件</p>
                                    </div>
                                </upload>--%>
                            </i-col>
                        </row>
                        <br>
                        <row>
                            <i-col span="2"><p>正文：</p></i-col>
                            <i-col span="22"><i-input type="textarea" rows="10" name="content"></i-input></i-col>
                        </row>
                        <br>
                        <row>
                            <i-col span="2" style="color: transparent">1</i-col>
                            <i-col span="22"><icon type="md-person"></icon>&nbsp发信人：${username}</i-col>
                        </row>
                        <br>
                        <div>
                            <button type="submit" class="btn btn-primary btn-sm" name="submit" value="send">发 送</button>
                            <button type="submit" class="btn btn-primary btn-sm" name="submit" value="draft">存 草 稿</button>
                        </div>
                    </i-content>
                </form>
                <i-footer>
                    <p style="text-align: center">Copyright &copy; 1997-2018 FuRui. All Rights Reserves</p>
                </i-footer>
            </layout>
            <layout :style="{padding: '0 24px 24px'}" v-else-if="flag === 'update'">
                <breadcrumb :style="{margin: '24px 0'}">
                    <breadcrumb-item>信息发布系统</breadcrumb-item>
                    <breadcrumb-item>写信</breadcrumb-item>
                </breadcrumb>
                <form id="updateMsg" action="/update?sender=${username}&status=1" method="post">
                    <i-content>
                        <div style="display: none">
                            <i-input type="text" name="id" v-bind:value="container.dataMsg.id"></i-input>
                        </div>
                        <div>
                            <button type="submit" class="btn btn-primary btn-sm" name="submit" value="send">发 送</button>
                            <button type="submit" class="btn btn-primary btn-sm" name="submit" value="draft">存 草 稿</button>
                        </div>
                        <br>
                        <row>
                            <i-col span="2"><p>收信人：</p></i-col>
                            <i-col span="22"><i-input prefix="ios-contact" type="text" name="receiver" v-bind:value="container.dataMsg.receiver"></i-input></i-col>
                        </row>
                        <br>
                        <row>
                            <i-col span="2"><p>主题：</p></i-col>
                            <i-col span="22"><i-input prefix="ios-star" type="text" name="theme" v-bind:value="container.dataMsg.theme"></i-input></i-col>
                        </row>
                        <br>
                        <row>
                            <i-col span="2"><p>文件上传：</p></i-col>
                            <i-col span="22">
                                <input type="file" id="InputFile" name="attachment">
                                <p>{{container.dataMsg.attachment}}</p>
                                <%--                                <upload
                                                                        multiple
                                                                        type="drag"
                                                                        name="attachment"
                                                                        action="//jsonplaceholder.typicode.com/posts/">
                                                                    <div style="padding: 20px 0">
                                                                        <icon type="ios-cloud-upload" size="52" style="color: rgba(81,90,110,0.8)"></icon>
                                                                        <p>添 加 附 件</p>
                                                                    </div>
                                                                </upload>--%>
                            </i-col>
                        </row>
                        <br>
                        <row>
                            <i-col span="2"><p>正文：</p></i-col>
                            <i-col span="22"><i-input type="textarea" rows="10" name="content" v-bind:value="container.dataMsg.content"></i-input></i-col>
                        </row>
                        <br>
                        <row>
                            <i-col span="2" style="color: transparent">1</i-col>
                            <i-col span="22"><icon type="md-person"></icon>&nbsp发信人：${username}</i-col>
                        </row>
                        <br>
                        <div>
                            <button type="submit" class="btn btn-primary btn-sm" name="submit" value="send">发 送</button>
                            <button type="submit" class="btn btn-primary btn-sm" name="submit" value="draft">存 草 稿</button>
                        </div>
                    </i-content>
                </form>
                <i-footer>
                    <p style="text-align: center">Copyright &copy; 1997-2018 FuRui. All Rights Reserves</p>
                </i-footer>
            </layout>
            <layout :style="{padding: '0 24px 24px'}" v-else-if="flag === 'receive'" >
                <breadcrumb :style="{margin: '24px 0'}">
                    <breadcrumb-item>信息发布系统</breadcrumb-item>
                    <breadcrumb-item>收信</breadcrumb-item>
                </breadcrumb>
                <i-content>
                    <div>
                        <i-button @click="handleSelectAll(true)">全选</i-button>
                        <i-button @click="handleSelectAll(false)">取消全选</i-button>
                        <i-button>删除</i-button>
                    </div>
                    <br>
                    <i-table ref="selection" :columns="columnsReceive" :data="dataReceive"></i-table>
                    <br>
                    <div>
                        <i-button @click="handleSelectAll(true)">全选</i-button>
                        <i-button @click="handleSelectAll(false)">取消全选</i-button>
                        <i-button>删除</i-button>
                    </div>
                </i-content>
                <i-footer>
                    <p style="text-align: center">Copyright &copy; 1997-2018 FuRui. All Rights Reserves</p>
                </i-footer>
            </layout>
            <layout :style="{padding: '0 24px 24px'}" v-else-if="flag === 'list'" >
                <breadcrumb :style="{margin: '24px 0'}">
                    <breadcrumb-item>信息发布系统</breadcrumb-item>
                    <breadcrumb-item>通讯录</breadcrumb-item>
                </breadcrumb>
                <i-content>
                    <div>
                        <i-button @click="handleSelectAll(true)">全选</i-button>
                        <i-button @click="handleSelectAll(false)">取消全选</i-button>
                        <i-button>删除</i-button>
                    </div>
                    <br>
                    <i-table ref="selection" :columns="columnsList" :data="dataList"></i-table>
                    <br>
                    <div>
                        <i-button @click="handleSelectAll(true)">全选</i-button>
                        <i-button @click="handleSelectAll(false)">取消全选</i-button>
                        <i-button>删除</i-button>
                    </div>
                </i-content>
                <i-footer>
                    <p style="text-align: center">Copyright &copy; 1997-2018 FuRui. All Rights Reserves</p>
                </i-footer>
            </layout>
            <layout :style="{padding: '0 24px 24px'}" v-else-if="flag === 'draft'">
                <breadcrumb :style="{margin: '24px 0'}">
                    <breadcrumb-item>信息发布系统</breadcrumb-item>
                    <breadcrumb-item>草稿箱</breadcrumb-item>
                </breadcrumb>
                <i-content>
                    <div>
                        <i-button @click="handleSelectAll(true)">全选</i-button>
                        <i-button @click="handleSelectAll(false)">取消全选</i-button>
                        <i-button>删除</i-button>
                    </div>
                    <br>
                    <i-table ref="selection" :columns="columnsDraft" :data="dataDraft"></i-table>
                    <br>
                    <div>
                        <i-button @click="handleSelectAll(true)">全选</i-button>
                        <i-button @click="handleSelectAll(false)">取消全选</i-button>
                        <i-button>删除</i-button>
                    </div>
                </i-content>
                <i-footer>
                    <p style="text-align: center">Copyright &copy; 1997-2018 FuRui. All Rights Reserves</p>
                </i-footer>
            </layout>
            <layout :style="{padding: '0 24px 24px'}" v-else-if="flag === 'send'">
                <breadcrumb :style="{margin: '24px 0'}">
                    <breadcrumb-item>信息发布系统</breadcrumb-item>
                    <breadcrumb-item>已发送</breadcrumb-item>
                </breadcrumb>
                <i-content>
                    <div>
                        <i-button @click="handleSelectAll(true)">全选</i-button>
                        <i-button @click="handleSelectAll(false)">取消全选</i-button>
                        <i-button>删除</i-button>
                    </div>
                    <br>
                    <i-table ref="selection" :columns="columnsSend" :data="dataSend"></i-table>
                    <br>
                    <div>
                        <i-button @click="handleSelectAll(true)">全选</i-button>
                        <i-button @click="handleSelectAll(false)">取消全选</i-button>
                        <i-button>删除</i-button>
                    </div>
                </i-content>
                <i-footer>
                    <p style="text-align: center">Copyright &copy; 1997-2018 FuRui. All Rights Reserves</p>
                </i-footer>
            </layout>
            <layout :style="{padding: '0 24px 24px'}" v-else-if="flag === 'message'">
                <breadcrumb :style="{margin: '24px 0'}">
                    <breadcrumb-item>信息发布系统</breadcrumb-item>
                    <breadcrumb-item>邮件</breadcrumb-item>
                </breadcrumb>
                <i-content>
                    <div>
                        <i-button @click="trans(container.returnFlag)"><icon type="ios-undo"></icon> 返回</i-button>
                        <i-button >回复</i-button>
                        <i-button >转发</i-button>
                        <i-button >删除</i-button>
                    </div>
                    <br>
                    <h3>{{container.dataMsg.theme}}</h3>
                    <hr>
                    <p style="font-size: 13px">发件人：{{container.dataMsg.sender}}</p>
                    <p style="font-size: 13px">时&nbsp;&nbsp;&nbsp;&nbsp;间：{{container.dataMsg.time}}</p>
                    <p style="font-size: 13px">收件人：{{container.dataMsg.receiver}}</p>
                    <br>
                    <div style="background:#eee;">
                        <card :bordered="false" dis-hover>
                            <h4 slot="title">{{container.dataMsg.theme}}</h4>
                            <p>{{container.dataMsg.content}}</p>
                        </card>
                    </div>
                    <br>
                    <div>
                        <i-button @click="trans(container.returnFlag)"><icon type="ios-undo"></icon> 返回</i-button>
                        <i-button >回复</i-button>
                        <i-button >转发</i-button>
                        <i-button >删除</i-button>
                    </div>
                </i-content>

                <i-footer>
                    <p style="text-align: center">Copyright &copy; 1997-2018 FuRui. All Rights Reserves</p>
                </i-footer>
            </layout>

        </layout>
    </layout>

</div>
<script src="../js/ajax.js"></script>
<script src="../js/jquery-2.1.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/vue.min.js"></script>
<script src="../js/iview.min.js"></script>
<script type="text/javascript" src="../js/homepage.js" charset="UTF-8"></script>

</body>
</html>