<xsl:stylesheet 
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        version="1.0">
    <xsl:template match="/hiblock">
        <html>
            <head>
                <title>РГЗ</title>
            </head>
            <body>
                <style>
                    .TaskOne{
                        display:grid;
                        grid-column-gap: 0px;
                        grid-row-gap: 0px;
                        gap: 0px;
                        border: 0px;
                        padding: 0px;
                        margin: 0px;
                    }

                    .TaskZero td{
                        padding: 10px;
                    }
                                       
                    .TaskThree{
                        float: left;
                        padding:20px;
                        margin:20px;
                    }

                    table{
                        border-collapse: collapse;
                    }

                    th{
                        border: 2px solid black;
                    }

                    td{
                        border: 2px solid black;
                    } 

                    .TaskOneImg {
                        display: grid;
                        grid-column-gap: 0px;
                        grid-row-gap: 0px;
                        border: 0px;
                    }

                    .TaskOneImg tr td {
                        margin: 0;
                        padding: 0;
                        border 0px;
                    }
                    
                </style>
                <h2>РГЗ</h2>
                <h3>Выполнил: Name</h3>
                <h3>Группа: Liberty-1</h3>
                <h3>Вариант: 4</h3>
                <hr/>
                <xsl:for-each select="page[@num = '0']">
                <hr/>
                <h2>Страница <xsl:value-of select="@num"/></h2>
                <hr/>
                </xsl:for-each>
                <xsl:value-of select="page[@num = '0']/name"/>
                <br/>
                <br/>
                <strong><xsl:value-of select="page[@num = '0']/variants/sequence[@variant = '4']/name"/></strong>
                <br/>
                <br/>            
                <table class="TaskZero">
                    <tr>
                        <td align="center"><strong>N</strong></td>
                        <xsl:for-each select="page/variants/sequence[@variant = '4']/items/item/num">
                            <td style="background-color:{@color}; color:white;"><strong><xsl:value-of select="current()"/></strong></td>
                        </xsl:for-each>
                    </tr>
                    <tr>
                        <td><strong>Значение</strong></td>
                        <xsl:for-each select="page/variants/sequence[@variant = '4']/items/item">
                            <td><strong><xsl:value-of select="val"/></strong></td>
                        </xsl:for-each>
                    </tr>
                </table>
                <xsl:for-each select="page[@num = '1']">
                <hr/>
                <h2>Страница <xsl:value-of select="@num"/></h2>
                <hr/>
                </xsl:for-each>
                <xsl:value-of select="page[@num = '1']/name"/>
                <br/>           
                <table>  
                    <tbody class="TaskOneImg" style="grid-template-columns: repeat({page[@num = '1']/table/@row-size}, auto); grid-template-rows: repeat({page[@num = '1']/table/@row-size}, auto);">            
                        <xsl:for-each select="page[@num = '1']/table/item">
                            <xsl:sort select="order" data-type="number" order="descending"/>
                            <tr> 
                                <td class="TaskOne">
                                    <img src="{url}"/>                               
                                </td>                           
                            </tr> 
                        </xsl:for-each> 
                    </tbody>                     
                </table>
                <xsl:for-each select="page[@num = '2']">
                <hr/>
                <h2>Страница <xsl:value-of select="@num"/></h2>
                <hr/>
                </xsl:for-each>
                <xsl:value-of select="page[@num = '2']/name"/>  
                <table border="3">
                    <xsl:for-each select="page[@num = '2']/countries/country">
                    <xsl:sort select="id" data-type="number"/>
                    <tr>               
                        <td><strong><xsl:value-of select="id"/></strong></td>
                        <td><strong><xsl:value-of select="uf_name"/></strong></td>
                        <td><img src="{uf_icon}"/></td>
                    </tr>
                    </xsl:for-each>
                </table>
                <xsl:for-each select="page[@num = '3']">
                <hr/>
                <h2>Страница <xsl:value-of select="@num"/></h2>
                <h3>
                    <xsl:value-of select="page[@num = '3']/name"/>
                </h3>
                </xsl:for-each>
                <hr/>

                <xsl:variable name="p" select="page[@num = '3']/students/student"/>
				<xsl:variable name="gl" select="page[@num = '3']/groups/group"/>
				<xsl:variable name="sl" select="page[@num = '3']/subjects/subject"/>

				
					<xsl:for-each select="page[@num = '3']/subjects/subject">
					<div class="TaskThree">
						<h4>
							<xsl:value-of  select="name"/>
						</h4>
						<xsl:variable name="number" select="@id"/>
						<table border="1" cellspacing="0" cellpadding="5">
							<xsl:for-each select="$p">
								<xsl:sort select="lname" data-type="text"/>
								<xsl:if test="subjects/subject = $number">
									<tr>
										<td>
											<strong>
												<xsl:value-of  select="lname"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="translate(fname, 'абвгдеёжзийклмнопрстуфхцчшщъыьэюя', '')"/>
												<xsl:text>.</xsl:text>
												<xsl:value-of select="translate(sname, 'абвгдеёжзийклмнопрстуфхцчшщъыьэюя', '')"/>
												<xsl:text>.</xsl:text>
											</strong>
										</td>
										<td>
											<xsl:variable name="g" select="group"/>
											<xsl:value-of select="$gl[@id = $g]/name"/>
										</td>
									</tr>
								</xsl:if>
							</xsl:for-each>
						</table>
					</div>
					</xsl:for-each>
                 
                    <div class="TaskThree">
                        <h4>Не участвующие студенты</h4>
                        <table border="1" cellspacing="0" cellpadding="5">    
                            <xsl:for-each select="page[@num = '3']/students/student">
                                <xsl:sort select="lname" data-type="text"/>
                                <xsl:if test="not(string(subjects))">
                                    <tr>
                                        <td>
                                            <strong>
                                                <xsl:value-of select="lname"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="translate(fname, 'абвгдеёжзийклмнопрстуфхцчшщъыьэюя', '')"/>
                                                <xsl:text>.</xsl:text>
                                                <xsl:value-of select="translate(sname, 'абвгдеёжзийклмнопрстуфхцчшщъыьэюя', '')"/>
                                                <xsl:text>.</xsl:text>
                                            </strong>
                                        </td>
                                        <td>
                                            <xsl:variable name="g" select="group"/>
                                            <xsl:value-of select="$gl[@id = $g]/name"/>
                                        </td>
                                    </tr>
                                </xsl:if>
                            </xsl:for-each>
                        </table>
                    </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
