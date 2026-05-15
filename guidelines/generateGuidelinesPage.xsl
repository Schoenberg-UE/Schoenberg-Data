<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="xhtml" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="/">
        <!--<html>
            <head>
                <meta charset="utf-8"/>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
            </head>
            <body>-->
                <div xmlns="http://www.w3.org/1999/xhtml" data-template="templates:surround" data-template-with="templates/page.html" data-template-at="content">
                    <div id="page-content">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 text-justify mb-5" lang="de"> <!-- style="font-size: 0.9em;" -->
                                    <xsl:apply-templates select="//tei:body/tei:head"/>
                                    <xsl:apply-templates select="//tei:body/tei:div/tei:div[1]"/>
                                    <div class="list-of-content p-4 my-4" style="border: 1px solid lightgrey;">
                                        <h3 class="mb-4" style="font-weight: 200;">Inhalt</h3>
                                        <ul>
                                            <xsl:for-each select="//tei:body/tei:div/tei:div[@n]">
                                                <li>
                                                    <a href="#chapter-{@n}">
                                                        <xsl:value-of select="tei:head"/>
                                                    </a>
                                                </li>
                                                <xsl:if test="tei:div[@n]">
                                                    <ul>
                                                        <xsl:for-each select="tei:div[@n]">
                                                            <li style="text-indent: 1em;">
                                                                <a href="#chapter-{@n}">
                                                                    <xsl:value-of select="tei:head"/>
                                                                </a>
                                                            </li>
                                                            <xsl:if test="tei:div[@n]">
                                                                <ul>
                                                                    <xsl:for-each select="tei:div[@n]">
                                                                        <li style="text-indent: 2em;">
                                                                            <a href="#chapter-{@n}">
                                                                                <xsl:value-of select="tei:head"/>
                                                                            </a>
                                                                        </li>
                                                                    </xsl:for-each>
                                                                </ul>
                                                            </xsl:if>
                                                        </xsl:for-each>
                                                    </ul>
                                                </xsl:if>
                                            </xsl:for-each>
                                        </ul>
                                    </div>
                                    <xsl:apply-templates select="//tei:body/tei:div/tei:div[@n]"/>
                                </div>
                            </div>
                            <div class="catStickyTop" style="opacity: 0; pointer-events: none;">
                                <svg xmlns="http://www.w3.org/2000/svg" class="bi bi-chevron-double-up" width="32px" height="32px" viewBox="0 0 16 16" fill="currentColor">
                                    <path fill-rule="evenodd" d="M7.646 2.646a.5.5 0 01.708 0l6 6a.5.5 0 01-.708.708L8 3.707 2.354 9.354a.5.5 0 11-.708-.708l6-6z" clip-rule="evenodd"/>
                                    <path fill-rule="evenodd" d="M7.646 6.646a.5.5 0 01.708 0l6 6a.5.5 0 01-.708.708L8 7.707l-5.646 5.647a.5.5 0 01-.708-.708l6-6z" clip-rule="evenodd"/>
                                </svg>
                            </div>
                        </div>
                    </div>
                    <script src="https://cdn.jsdelivr.net/gh/google/code-prettify@master/loader/run_prettify.js?lang=xml"/>
                    <script>
                        let scrollTop = document.querySelector('.catStickyTop')
                        document.addEventListener('scroll', () => {
                            if (window.scrollY > '600') {
                                scrollTop.style.opacity = 1
                                scrollTop.style.pointerEvents = 'auto'
                            }
                            else {
                                scrollTop.style.opacity = 0;
                                scrollTop.style.pointerEvents = 'none'
                            }
                        })
                        scrollTop.addEventListener('click', () => {
                            window.scrollTo(0, 100);
                        })
                    </script>
                </div>
            <!--</body>
        </html>-->
    </xsl:template>
    
    <xsl:template match="tei:body/tei:head">
        <h2 xmlns="http://www.w3.org/1999/xhtml" class="my-5">
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    
    <xsl:template match="tei:div">
        <div xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:head">
        <xsl:variable name="chapter" select="parent::tei:div/@n"/>
        <xsl:choose>
            <xsl:when test="tokenize($chapter, '\.')[3]">
                <h6 xmlns="http://www.w3.org/1999/xhtml" class="mt-4 mb-2" id="chapter-{$chapter}" style="font-weight: 200;">
                    <xsl:apply-templates/>
                </h6>
            </xsl:when>
            <xsl:when test="tokenize($chapter, '\.')[2]">
                <h5 xmlns="http://www.w3.org/1999/xhtml" class="mt-4 mb-2" id="chapter-{$chapter}" style="font-weight: 200;">
                    <xsl:apply-templates/>
                </h5>
            </xsl:when>
            <xsl:otherwise>
                <h3 xmlns="http://www.w3.org/1999/xhtml" class="mt-5 mb-3" id="chapter-{$chapter}" style="font-weight: 200;">
                    <xsl:apply-templates/>
                </h3>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:code">
        <!--<code xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates/>
        </code>-->
        <pre xmlns="http://www.w3.org/1999/xhtml" class="prettyprint lang-xml" style="font-size: 0.8rem; border: none; white-space: pre-wrap; margin-bottom: 0px; word-break: break-all;"> <!-- white-space: pre-wrap; to prevent scroll bars -->
                <xsl:apply-templates mode="serialize"/>
                <!--<xmp>
                    <!-\-<xsl:copy-of select="."/>-\->
                    <xsl:apply-templates/>
                </xmp>-->
            </pre>
    </xsl:template>
    
    <xsl:template match="tei:table">
        <!--<xsl:if test="not(preceding::tei:table)">
            <div class="row" xmlns="http://www.w3.org/1999/xhtml" style="border-bottom: 1px solid lightgrey;">
                <div class="col-md-4 my-2">
                    <xsl:text>TEI-Codierung</xsl:text>
                </div>
                <div class="col-md-4 my-2" style="border-left: 1px solid lightgrey; border-right: 1px solid lightgrey">
                    <xsl:text>Beschreibung</xsl:text>
                </div>
                <div class="col-md-4 my-2">
                    <xsl:text>Webdarstellung</xsl:text>
                </div>
            </div>
        </xsl:if>
        <div xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates/>
        </div>-->
        <table xmlns="http://www.w3.org/1999/xhtml" class="table table-bordered">
            <xsl:if test="not(preceding::tei:table)">
                <thead>
                    <tr>
                        <th scope="col" style="font-weight: 400;">
                            <xsl:text>TEI-Codierung</xsl:text>
                        </th>
                        <th scope="col" style="font-weight: 400;">
                            <xsl:text>Beschreibung</xsl:text>
                        </th>
                        <th scope="col" style="font-weight: 400;">
                            <xsl:text>Webdarstellung</xsl:text>
                        </th>
                    </tr>
                </thead>
            </xsl:if>
            <tbody>
                <xsl:apply-templates/>
            </tbody>
        </table>
    </xsl:template>
    
    <xsl:template match="tei:row">
        <!--<div class="row" xmlns="http://www.w3.org/1999/xhtml" style="border-bottom: 1px solid lightgrey;">
            <xsl:if test="@xml:id">
                <xsl:attribute name="id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </div>-->
        <tr xmlns="http://www.w3.org/1999/xhtml">
            <xsl:if test="@xml:id">
                <xsl:attribute name="id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </tr>
    </xsl:template>
    
    <xsl:template match="tei:cell">
        <!--<div class="col-md-4 my-2" xmlns="http://www.w3.org/1999/xhtml" style="{if (index-of(parent::tei:row/tei:cell, .) = 2) then 'border-left: 1px solid lightgrey; border-right: 1px solid lightgrey' else ''}">
            <xsl:apply-templates/>
        </div>-->
        <td xmlns="http://www.w3.org/1999/xhtml">
            <xsl:choose>
                <xsl:when test="index-of(parent::tei:row/tei:cell, .) = 1">
                    <xsl:attribute name="style">
                        <xsl:value-of select="'width: 33%;'"/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="style">
                        <xsl:value-of select="'width: 33%;'"/>
                    </xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="@rows">
                <xsl:attribute name="rowspan">
                    <xsl:value-of select="@rows"/>
                </xsl:attribute>
            </xsl:if>
            <!--<xsl:if test="not(preceding-sibling::tei:cell)">
                <xsl:attribute name="style">
                    <xsl:value-of select="'width: 40%;'"/>
                </xsl:attribute>
            </xsl:if>-->
            <xsl:apply-templates/>
        </td>
    </xsl:template>
    
    <xsl:template match="tei:ref[@target]">
        <a href="{@target}" xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    
    <xsl:template match="tei:list">
        <ul xmlns="http://www.w3.org/1999/xhtml" style="list-style-type: circle; padding-left: 2rem;">
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    
    <xsl:template match="tei:item">
        <li xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    
    <xsl:template match="tei:graphic">
        <xsl:variable name="url" select="@url"/>
        <xsl:variable name="codeEx" select="doc($url || '.xml')//tei:code"/>
        <xsl:apply-templates select="$codeEx"/>
    </xsl:template>
    
    <xsl:template match="element()" mode="serialize">
        <xsl:text>&lt;</xsl:text>
        <xsl:value-of select="name(.)"/>
        <xsl:for-each select="@*">
            <xsl:text> </xsl:text>
            <xsl:value-of select="name()"/>
            <xsl:text>="</xsl:text>
            <xsl:value-of select="string()"/>
            <xsl:text>"</xsl:text>
        </xsl:for-each>
        <xsl:text>&gt;</xsl:text>
        <xsl:apply-templates mode="serialize"/>
        <xsl:text>&lt;/</xsl:text>
        <xsl:value-of select="name(.)"/>
        <xsl:text>&gt;</xsl:text>
    </xsl:template>
    
    <xsl:template match="text()" mode="serialize">
        <xsl:value-of select="."/>
        <!--<xsl:choose>
            <xsl:when test="normalize-space(.) = ''">
                <xsl:value-of select="."/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:otherwise>
        </xsl:choose>-->
    </xsl:template>
    
</xsl:stylesheet>